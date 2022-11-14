//
//  RECMessagingPushSubscriptionTrackRequest.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECMessagingPushSubscriptionTrackRequest: Encodable {
    let token: RECMessagingPushToken
    let applicationName: String
    let subscriptionStatus: RECMessagingPushSubscriptionStatus?
    let subscriptionStatusChangeDateInSeconds: Int?
    let firstSubscribedDateInSeconds: Int?
    
    // MARK: Init
    
    init(
        token: RECMessagingPushToken,
        applicationName: String,
        subscriptionStatus: RECMessagingPushSubscriptionStatus? = nil,
        subscriptionStatusChangeDateInSeconds: Int? = nil,
        firstSubscribedDateInSeconds: Int? = nil
    ) {
        self.token = token
        self.applicationName = applicationName
        self.subscriptionStatus = subscriptionStatus
        self.subscriptionStatusChangeDateInSeconds = subscriptionStatusChangeDateInSeconds
        self.firstSubscribedDateInSeconds = firstSubscribedDateInSeconds
    }
    
    init(
        token: RECMessagingPushToken,
        applicationName: String,
        subscription: RECMessagingPushSubscription
    ) {
        self.init(
            token: token,
            applicationName: applicationName,
            subscriptionStatus: subscription.status,
            subscriptionStatusChangeDateInSeconds: subscription.statusChangedDate?.secondsSince1970,
            firstSubscribedDateInSeconds: subscription.firstSubscribedDate?.secondsSince1970)
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case token
        case applicationName = "application_id"
        case subscriptionStatus = "subscription_status"
        case subscriptionStatusChangeDateInSeconds = "subscription_status_change_date"
        case firstSubscribedDateInSeconds = "first_subscribed_date"
    }
}
