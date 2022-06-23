//
//  RECMessagingPushSubscriptionSettings.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.03.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECMessagingPushSubscriptionSettings {
    let subscriptionStatus: RECMessagingPushSubscriptionStatus
    let isUserSubscribed: Bool?
    let subscriptionStatusChangedDate: Date?
    let firstSubscribedDate: Date?
}
