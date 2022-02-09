//
//  RECMessagingAPIEndpoints.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECMessagingAPIEndpoints {
    static func updatePushNotificationsSubscription(
        accountId: String,
        deviceId: String
    ) -> RECAPIEndpoint {
        let path = "/v3/\(accountId)/messaging/channel/push/ios/subscription/\(deviceId)"
        let headers: [String: String] = ["Accept": "application/json",
                                         "Content-Type": "application/json"]
        return RECAPIEndpoint(
            path: path,
            httpMethod: "POST",
            headers: headers)
    }
    
    static func unsubscribeFromPushNotifications(
        accountId: String,
        deviceId: String
    ) -> RECAPIEndpoint {
        let path = "/v3/\(accountId)/messaging/channel/push/ios/subscription/\(deviceId)"
        let headers: [String: String] = ["Accept": "application/json"]
        return RECAPIEndpoint(
            path: path,
            httpMethod: "DELETE",
            headers: headers)
    }
    
    static func trackPushNotificationsEvent(
        accountId: String,
        pushId: String
    ) -> RECAPIEndpoint {
        let path = "/v3/\(accountId)/messaging/channel/push/\(pushId)/event"
        let headers: [String: String] = ["Accept": "application/json",
                                         "Content-Type": "application/json"]
        return RECAPIEndpoint(
            path: path,
            httpMethod: "POST",
            headers: headers)
    }
}
