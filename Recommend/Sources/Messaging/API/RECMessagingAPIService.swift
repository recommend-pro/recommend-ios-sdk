//
//  RECMessagingAPIService.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECMessagingAPIService {
    private typealias APIEndpoints = RECMessagingAPIEndpoints
    
    private let core: RECCore
    private var apiClient: RECAPIClient {
        return core.apiClient
    }
    private var config: RECConfig {
        return core.config
    }
    
    // MARK: Init
    
    init(core: RECCore) {
        self.core = core
    }
    
    // MARK: Update Push Notifications Subscription
    
    func updatePushNotificationsSubscription(
        model: RECMessagingPushSubscriptionRequest,
        completion: @escaping (Error?) -> Void
    ) {
        do {
            let deviceId = try core.getDeviceId()
            let endpoint = APIEndpoints.updatePushNotificationsSubscription(
                accountId: config.accountId,
                deviceId: deviceId)
            let data = try JSONEncoder().encode(model)
            
            self.apiClient.executeRequest(
                with: endpoint,
                httpBody: data,
                attemptsLimit: 1,
                completion: completion)
        } catch {
            completion(error)
        }
    }
    
    // MARK: Unsubscribe From Push Notifications
    
    func unsubscribeFromPushNotifications(completion: @escaping (Error?) -> Void) {
        do {
            let deviceId = try core.getDeviceId()
            let endpoint = APIEndpoints.unsubscribeFromPushNotifications(
                accountId: config.accountId,
                deviceId: deviceId)
            
            self.apiClient.executeRequest(
                with: endpoint,
                attemptsLimit: 1,
                completion: completion)
        } catch {
            completion(error)
        }
    }
    
    // MARK: Track Push Notification Event
    
    func trackPushNotificationEvent(
        _ pushNotificationEvent: RECMessagingPushEventRequest,
        completion: @escaping (Error?) -> Void
    ) {
        do {
            let endpoint = APIEndpoints.trackPushNotificationsEvent(
                accountId: config.accountId,
                pushId: pushNotificationEvent.pushId)
            let data = try JSONEncoder().encode(pushNotificationEvent.data)
            
            self.apiClient.executeRequest(
                with: endpoint,
                httpBody: data,
                attemptsLimit: 1,
                completion: completion)
        } catch {
            completion(error)
        }
    }
}
