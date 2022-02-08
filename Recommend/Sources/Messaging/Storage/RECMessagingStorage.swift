//
//  RECMessagingStorage.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

private let kRECMessagingStorageSuiteName = "pro.recommend.messaging"

// MARK: - RECMessagingStorage

final class RECMessagingStorage {
    private struct UserDefaultsKeys {
        private static var suiteName: String {
            return kRECMessagingStorageSuiteName
        }
        
        static let firstSubscribedDate = suiteName + ".first_subscribed_date"
        static let lastSubscriptionStatus = suiteName + ".last_subscription_status"
    }
    
    private lazy var userDefaults: UserDefaults! = {
        return UserDefaults(suiteName: kRECMessagingStorageSuiteName)
    }()
    
    var firstSubscribedDate: Int? {
        get {
            userDefaults?.integer(forKey: UserDefaultsKeys.firstSubscribedDate)
        }
        set {
            userDefaults?.set(newValue, forKey: UserDefaultsKeys.firstSubscribedDate)
            userDefaults?.synchronize()
        }
    }
    
    var lastSubscriptionStatus: RECMessagingSubscriptionStatus? {
        get {
            guard let rawValue = userDefaults?.string(forKey: UserDefaultsKeys.lastSubscriptionStatus) else {
                return nil
            }
            return RECMessagingSubscriptionStatus(rawValue: rawValue)
        }
        set {
            userDefaults?.set(newValue?.rawValue, forKey: UserDefaultsKeys.lastSubscriptionStatus)
        }
    }
}
