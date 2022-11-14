//
//  RECMessagingPushSubscriptionStatus.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UserNotifications

enum RECMessagingPushSubscriptionStatus: String, Encodable {
    case subscribed
    case unsubscribed
    case nonSubscribed = "non_subscribed"
    
    // MARK: Init
    
    init(
        authorizationStatus: UNAuthorizationStatus,
        isUserSubscribed: Bool?
    ) {
        guard let isUserSubscribed = isUserSubscribed else {
            self = .nonSubscribed
            return
        }
        
        guard isUserSubscribed == true else {
            self = .unsubscribed
            return
        }
        
        switch authorizationStatus {
        case .notDetermined:
            self = .nonSubscribed
            
        case .authorized,
             .provisional,
             .ephemeral:
            self = .subscribed
            
        case .denied:
            self = .unsubscribed
            
        @unknown default:
            self = .nonSubscribed
        }
    }
}
