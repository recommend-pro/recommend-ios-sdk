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
    private typealias PushNotificationEvent = RECMessagingPushEventRequest
    
    private static let userDefaultsSuiteName = "pro.recommend.messaging"
    
    private let core: RECCore
    private let apiService: RECMessagingAPIService
    private let userNotificationCenter: UNUserNotificationCenter

    private var userDefaults: UserDefaults!
    private var subscriptionManager: RECMessagingSubscriptionManager
    
    private var deviceToken: Data?
    
    private var applicationName: String? {
        return core.config.applicationName
    }
    
    // MARK: Init
    
    init(
        core: RECCore,
        userNotificationCenter: UNUserNotificationCenter = .current()
    ) {
        self.core = core
        self.apiService = RECMessagingAPIService(core: core)
        self.userNotificationCenter = userNotificationCenter
        
        self.userDefaults = UserDefaults(suiteName: Self.userDefaultsSuiteName)
        self.subscriptionManager = RECMessagingSubscriptionManager(
            userNotificationCenter: userNotificationCenter,
            userDefaults: self.userDefaults)
    }
    
    // MARK: Notification User Info
    
    public func isRecommendNotification(_ userInfo: [AnyHashable: Any]) -> Bool {
        return RECMessagingPushUserInfo(from: userInfo)?.isRecommendPushNotification ?? false
    }
    
    public func remoteNotificationOpenURL(_ userInfo: [AnyHashable: Any]) -> URL? {
        return RECMessagingPushUserInfo(from: userInfo)?.data?.openURL
    }
    
    // MARK: Track Push Notification Event
    
    private func trackPushNotificationEvent(_ event: PushNotificationEvent) {
        apiService.trackPushNotificationEvent(event) { error in
            if let error = error {
                debugPrint(error)
                return
            }
        }
    }
    
    // MARK: Push Notification Subscription
    
    public func subscribeToPushNotifications() {
        subscriptionManager.setUserSubscription(true)
        updatePushNotificationsSubscription()
    }
    
    public func unsubscribeFromPushNotifications() {
        subscriptionManager.setUserSubscription(false)
//        subscriptionManager.getSettings { _ in
//            self.apiService.unsubscribeFromPushNotifications { error in
//                if let error = error {
//                    debugPrint(error)
//                    return
//                }
//            }
//        }
        
        // Hot-fix
        updatePushNotificationsSubscription()
    }
    
    private func updatePushNotificationsSubscription() {
        guard let deviceToken = deviceToken else {
            return
        }
        
        guard let applicationName = applicationName else {
            return
        }
        
        subscriptionManager.getSettings { settings in
            let model = RECMessagingPushSubscriptionRequest(deviceToken: deviceToken,
                                                            applicationName: applicationName,
                                                            subscriptionStatus: settings.subscriptionStatus,
                                                            subscriptionStatusChangeDate: settings.subscriptionStatusChangedDate,
                                                            firstSubscribedDate: settings.firstSubscribedDate)
            self.apiService.updatePushNotificationsSubscription(model: model) { error in
                if let error = error {
                    debugPrint(error)
                    return
                }
            }
        }
    }
    
    // MARK: Remote Notifications
    
    public func setDeviceToken(_ deviceToken: Data) {
        self.deviceToken = deviceToken
        updatePushNotificationsSubscription()
    }
    
    public func applicationDidReceiveRemoteNotification(_ userInfo: [AnyHashable: Any]) {
        if let event = PushNotificationEvent(userInfo: userInfo,
                                             eventDate: Date()) {
            trackPushNotificationEvent(event)
        }
    }
    
    // MARK: User Notifications
    
    public func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse
    ) {
        guard center == userNotificationCenter else {
            return
        }
        if let event = PushNotificationEvent(notification: response.notification,
                                             clicked: true) {
            trackPushNotificationEvent(event)
        }
    }
}
