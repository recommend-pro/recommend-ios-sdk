//
//  RECMessagingPushManager.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UserNotifications

final class RECMessagingPushManager {
    private let apiService: RECMessagingAPIService
    private let userNotificationCenter: UNUserNotificationCenter
    private let applicationName: String
    private var pushToken: RECMessagingPushToken?
    private let subscriptionManager: RECMessagingPushSubscriptionManager
    private let failedEventsStorage: RECMessagingFailedPushEventsStorage
    
    private var failedEvents: [RECMessagingPushEvent] {
        get { failedEventsStorage.events }
        set { failedEventsStorage.events = newValue }
    }
    
    var openURLHandler: ((URL) -> Void)?
    
    // MARK: Init
    
    init(
        apiService: RECMessagingAPIService,
        userDefaults: UserDefaults,
        applicationName: String
    ) {
        self.apiService = apiService
        self.applicationName = applicationName
        self.userNotificationCenter = .current()
        self.subscriptionManager = RECMessagingPushSubscriptionManager(
            userNotificationCenter: userNotificationCenter,
            userDefaults: userDefaults)
        self.failedEventsStorage = RECMessagingFailedPushEventsStorage()
        
        // Auto-update
        subscriptionManager.subscriptionAutoUpdated = { subscription in
            self.trackSubscriptionUpdate(subscription)
        }
        
        // Failed push events tracking check
        checkOnFailedEvents()
    }
    
    // MARK: Subscription
    
    private func trackSubscriptionUpdate(_ subscription: RECMessagingPushSubscription) {
        guard let pushToken = self.pushToken else {
            return
        }
        
        let request = RECMessagingPushSubscriptionTrackRequest(
            token: pushToken,
            applicationName: applicationName,
            subscription: subscription)
        
        apiService.trackPushSubscriptionUpdate(request: request) { error in
            if error != nil {
                self.subscriptionManager.requestOneTimeForceUpdateForNext()
            }
        }
    }
    
    private func setUserSubscription(_ isUserSubscribed: Bool) {
        subscriptionManager.setUserSubscription(true) { result in
            guard result.isUpdated else { return }
            self.trackSubscriptionUpdate(result.subscription)
        }
    }
    
    func subscribe() {
        setUserSubscription(true)
    }
    
    func unsubscribe() {
        setUserSubscription(false)
    }
    
    // MARK: Token
    
    private func setToken(_ pushToken: RECMessagingPushToken) {
        self.pushToken = pushToken
        subscriptionManager.getSubscription { subscription in
            self.trackSubscriptionUpdate(subscription)
        }
    }
    
    func setToken(_ deviceToken: Data) {
        let token = RECMessagingPushToken(deviceToken: deviceToken)
        setToken(token)
    }
    
    // MARK: Event
    
    private func trackEvent(_ event: RECMessagingPushEvent) {
        failedEvents.removeAll(where: { $0.id == event.id })
        apiService.trackPushEvent(event) { error in
            if error != nil {
                self.failedEvents.append(event)
            }
        }
    }
    
    private func checkOnFailedEvents() {
        let failedEvents = self.failedEvents
        
        userNotificationCenter.getDeliveredNotifications { deliveredNotifications in
            let events: [RECMessagingPushEvent] = deliveredNotifications.compactMap({ notification in
                RECMessagingPushEvent(
                    userInfo: notification.request.content.userInfo,
                    eventTime: notification.date.secondsSince1970)
            }).reduce(into: failedEvents, { result, event in
                if result.contains(where: { $0.id == event.id }) == false {
                    result.append(event)
                }
            })
            
            events.forEach { event in
                self.trackEvent(event)
            }
        }
    }
    
    func handleReceivedRemoteNotification(
        _ userInfo: [AnyHashable: Any]
    ) {
        guard
            let event = RECMessagingPushEvent(
                userInfo: userInfo,
                eventTime: Date().secondsSince1970)
        else {
            return
        }
        trackEvent(event)
    }
    
    func handleReceivedNotificationResponse(
        _ response: UNNotificationResponse
    ) {
        guard
            let event = RECMessagingPushEvent(
                userInfo: response.notification.request.content.userInfo,
                clicked: true,
                eventTime: response.notification.date.secondsSince1970)
        else {
            return
        }
        
        if
            let urlString = event.data.openURL,
            let url = URL(string: urlString)
        {
            openURLHandler?(url)
        }
        
        trackEvent(event)
    }
    
    static func isRecommendNotification(_ userInfo: [AnyHashable: Any]) -> Bool {
        RECMessagingPushEvent(userInfo: userInfo) != nil
    }
}
