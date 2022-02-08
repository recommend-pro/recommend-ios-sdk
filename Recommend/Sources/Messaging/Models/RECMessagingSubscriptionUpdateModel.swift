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
    /// Id of push notification application integration
    let applicationId: String
    let subscriptionStatus: RECMessagingSubscriptionStatus?
    /// Timestamp in seconds
    let subscriptionStatusChangeDate: Int?
    /// Timestamp in seconds
    let firstSubscribedDate: Int?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case token
        case applicationId = "application_id"
        case subscriptionStatus = "subscription_status"
        case subscriptionStatusChangeDate = "subscription_status_change_date"
        case firstSubscribedDate = "first_subscribed_date"
    }
}
