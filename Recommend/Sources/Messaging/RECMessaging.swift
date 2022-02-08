//
//  RECMessaging.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UserNotifications

public final class RECMessaging: NSObject {
    private typealias APIService = RECMessagingAPIService
    private typealias Storage = RECMessagingStorage
    private typealias Token = RECMessagingToken
    private typealias PushNotificationEvent = RECMessagingPushNotificationEvent
    
    private let core: RECCore
    private let userNotificationCenter: UNUserNotificationCenter
    private let apiService: APIService
    private let storage: Storage
    
    private var applicationName: String {
        return core.config.appName
    }
    private var firstSubscribedDate: Int? {
        get {
            storage.firstSubscribedDate
        }
        set {
            storage.firstSubscribedDate = newValue
        }
    }
    private var lastSubscriptionStatus: RECMessagingSubscriptionStatus? {
        get {
            storage.lastSubscriptionStatus
        }
        set {
            storage.lastSubscriptionStatus = newValue
        }
    }
    
    // MARK: Init
    
    init(
        core: RECCore,
        userNotificationCenter: UNUserNotificationCenter = .current()
    ) {
        self.core = core
        self.userNotificationCenter = userNotificationCenter
        self.apiService = APIService(core: core)
        self.storage = Storage()
    }
    
    // MARK: User Info
    
    public func isRecommendNotification(_ userInfo: [AnyHashable: Any]) -> Bool {
        return RECMessagingUserInfo(from: userInfo)?.isRecommendPushNotification ?? false
    }
    
    public func remoteNotificationOpenURL(_ userInfo: [AnyHashable: Any]) -> URL? {
        return RECMessagingUserInfo(from: userInfo)?.data?.openURL
    }
    
    // MARK: Update Push Notifications Subscription
    
    private func updatePushNotificationsSubscription(model: RECMessagingSubscriptionUpdateModel) {
        apiService.updatePushNotificationsSubscription(model: model) { _ in
            // log error
        }
    }
    
    private func updatePushNotificationsSubscription(
        deviceToken: Data,
        subscriptionStatus: RECMessagingSubscriptionStatus?
    ) {
        if subscriptionStatus == .subscribed, firstSubscribedDate == nil {
            firstSubscribedDate = Int(Date().timeIntervalSince1970)
        }
        
        var subscriptionStatusChangeDate: Int?
        var targetSubscriptionStatus: RECMessagingSubscriptionStatus?
        
        if let subscriptionStatus = subscriptionStatus, subscriptionStatus != lastSubscriptionStatus {
            subscriptionStatusChangeDate = Int(Date().timeIntervalSince1970)
            targetSubscriptionStatus = subscriptionStatus
        }
        lastSubscriptionStatus = subscriptionStatus
        
        let token = RECMessagingToken(deviceToken: deviceToken)
        let model = RECMessagingSubscriptionUpdateModel(token: token,
                                                        applicationId: applicationName,
                                                        subscriptionStatus: targetSubscriptionStatus,
                                                        subscriptionStatusChangeDate: subscriptionStatusChangeDate,
                                                        firstSubscribedDate: firstSubscribedDate)
        updatePushNotificationsSubscription(model: model)
    }
    
    private func updatePushNotificationsSubscription(
        deviceToken: Data,
        authorizationStatus: UNAuthorizationStatus
    ) {
        let subscriptionStatus = RECMessagingSubscriptionStatus(from: authorizationStatus)
        updatePushNotificationsSubscription(deviceToken: deviceToken,
                                            subscriptionStatus: subscriptionStatus)
    }
    
    public func updatePushNotificationsSubscription(deviceToken: Data) {
        userNotificationCenter.getNotificationSettings { (settings) in
            self.updatePushNotificationsSubscription(deviceToken: deviceToken,
                                                     authorizationStatus: settings.authorizationStatus)
        }
    }
    
    // MARK: Unsubscribe From Push Notifications
    
    public func unsubscribeFromPushNotifications() {
        apiService.unsubscribeFromPushNotifications { _ in
            // log error
        }
    }
    
    // MARK: Track Push Notification Event
    
    private func trackPushNotificationEvent(_ event: PushNotificationEvent) {
        apiService.trackPushNotificationEvent(model: event)  { _ in
            // log error
        }
    }
    
    private func trackPushNotificationEvent(
        userInfo: [AnyHashable: Any],
        clicked: Bool? = nil,
        eventDate: Date?
    ) {
        guard
            let event = PushNotificationEvent(userInfo: userInfo,
                                              clicked: clicked,
                                              eventDate: eventDate)
        else {
            return
        }
        
        trackPushNotificationEvent(event)
    }
    
    private func trackPushNotificationEvent(
        notification: UNNotification,
        clicked: Bool? = nil
    ) {
        trackPushNotificationEvent(userInfo: notification.request.content.userInfo,
                                   clicked: clicked,
                                   eventDate: notification.date)
    }
    
    // MARK: Remote Notifications
    
    public func applicationDidReceiveRemoteNotification(_ userInfo: [AnyHashable: Any]) {
        self.trackPushNotificationEvent(userInfo: userInfo,
                                        eventDate: Date())
    }
    
    // MARK: User Notifications
    
    public func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse
    ) {
        guard center == userNotificationCenter else {
            return
        }
        trackPushNotificationEvent(notification: response.notification,
                                   clicked: true)
    }
}

// MARK: - UNUserNotificationCenterDelegate

extension RECMessaging: UNUserNotificationCenterDelegate {
    public func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.alert, .sound, .badge])
    }
    
    public func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        userNotificationCenter(center, didReceive: response)
        completionHandler()
    }
}
