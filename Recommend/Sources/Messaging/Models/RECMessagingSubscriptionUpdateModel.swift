//
//  RECMessagingSubscriptionUpdateModel.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECMessagingSubscriptionUpdateModel: Encodable {
    /// Push token of device
    let token: RECMessagingToken
    /// Name of push notification application integration
    let applicationName: String
    let subscriptionStatus: RECMessagingSubscriptionStatus?
    /// Timestamp in seconds
    let subscriptionStatusChangeDateInSeconds: Int?
    /// Timestamp in seconds
    let firstSubscribedDateInSeconds: Int?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case token
        case applicationName = "application_id"
        case subscriptionStatus = "subscription_status"
        case subscriptionStatusChangeDateInSeconds = "subscription_status_change_date"
        case firstSubscribedDateInSeconds = "first_subscribed_date"
    }
    
    // MARK: Init
    
    init(
        token: RECMessagingToken,
        applicationName: String,
        subscriptionStatus: RECMessagingSubscriptionStatus? = nil,
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
        deviceToken: Data,
        applicationName: String,
        subscriptionStatus: RECMessagingSubscriptionStatus? = nil,
        subscriptionStatusChangeDate: Date? = nil,
        firstSubscribedDate: Date? = nil
    ) {
        let token = RECMessagingToken(deviceToken: deviceToken)
        
        self.init(token: token,
                  applicationName: applicationName,
                  subscriptionStatus: subscriptionStatus,
                  subscriptionStatusChangeDateInSeconds: subscriptionStatusChangeDate?.secondsSince1970,
                  firstSubscribedDateInSeconds: firstSubscribedDate?.secondsSince1970)
    }
}
