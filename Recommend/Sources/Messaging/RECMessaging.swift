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
    
    private let core: RECCore
    private let userNotificationCenter: UNUserNotificationCenter
    private let apiService: APIService
    
    private var applicationName: String {
        return core.config.appName
    }
    
    // MARK: Init
    
    init(core: RECCore, userNotificationCenter: UNUserNotificationCenter = .current()) {
        self.core = core
        self.userNotificationCenter = userNotificationCenter
        self.apiService = APIService(core: core)
    }
    
    // MARK: Info
    
    public func isRecommendNotification(_ userInfo: [AnyHashable: Any]) -> Bool {
        return RECMessagingUserInfo(from: userInfo)?.isRecommendPushNotification ?? false
    }
    
    public func remoteNotificationOpenURL(_ userInfo: [AnyHashable: Any]) -> URL? {
        return RECMessagingUserInfo(from: userInfo)?.data?.openURL
    }
    
    // MARK: Update Push Notifications Subscription
    
    private func updatePushNotificationsSubscription(model: RECMessagingSubscriptionUpdateModel,
                                                     completion: @escaping (Error?) -> Void) {
        apiService.updatePushNotificationsSubscription(model: model, completion: completion)
    }
    
    // MARK: Unsubscribe From Push Notifications
    
    private func unsubscribeFromPushNotifications(completion: @escaping (Error?) -> Void) {
        apiService.unsubscribeFromPushNotifications(completion: completion)
    }
    
    // MARK: Track Push Notification Event
    
    private func trackPushNotificationEvent(model: RECMessagingPushNotificationEvent,
                                            completion: @escaping (Error?) -> Void) {
        apiService.trackPushNotificationEvent(model: model, completion: completion)
    }
    
    private func trackPushNotificationEvent(userInfo: [AnyHashable: Any],
                                            clicked: Bool?,
                                            eventDate: Date?) {
        guard
            let event = RECMessagingPushNotificationEvent(userInfo: userInfo,
                                                          clicked: clicked,
                                                          eventDate: eventDate)
        else {
            return
        }
        
        trackPushNotificationEvent(model: event) { _ in
            // log error
        }
    }
    
    private func trackPushNotificationEvent(notification: UNNotification,
                                            clicked: Bool?) {
        trackPushNotificationEvent(userInfo: notification.request.content.userInfo,
                                   clicked: clicked,
                                   eventDate: notification.date)
    }
    
    // MARK: UNUserNotificationCenter
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter,
                                       didReceive response: UNNotificationResponse) {
        guard center == userNotificationCenter else {
            return
        }
        trackPushNotificationEvent(notification: response.notification,
                                   clicked: true)
    }
}

// MARK: - UNUserNotificationCenterDelegate

extension RECMessaging: UNUserNotificationCenterDelegate {
    public func userNotificationCenter(_ center: UNUserNotificationCenter,
                                       willPresent notification: UNNotification,
                                       withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter,
                                       didReceive response: UNNotificationResponse,
                                       withCompletionHandler completionHandler: @escaping () -> Void) {
        userNotificationCenter(center, didReceive: response)
        completionHandler()
    }
}
