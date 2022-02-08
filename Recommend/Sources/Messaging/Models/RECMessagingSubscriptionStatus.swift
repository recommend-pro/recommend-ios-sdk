//
//  RECMessagingSubscriptionStatus.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

enum RECMessagingSubscriptionStatus: String, Encodable {
    case subscribed
    case unsubscribed
    case nonSubscribed = "non_subscribed"
}
