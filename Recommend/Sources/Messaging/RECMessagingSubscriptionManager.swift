//
//  RECMessagingSubscriptionManager.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.03.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UserNotifications

final class RECMessagingSubscriptionManager {
    private struct UserDefaultsKeys {
        static let isUserSubscribed: String = "is_user_subscribed"
        static let subscriptionStatus: String = "subscription_status"
        static let subscriptionStatusChangeDate: String = "subscription_status_change_date"
        static let firstSubscribedDate: String = "first_subscribed_date"
    }
    
    private let userNotificationCenter: UNUserNotificationCenter
    private let userDefaults: UserDefaults!
    
    // MARK: Subscription settings
    
    private(set) var isUserSubscribed: Bool? {
        didSet {
            userDefaults?.set(isUserSubscribed, forKey: UserDefaultsKeys.isUserSubscribed)
        }
    }
    private(set) var subscriptionStatus: RECMessagingPushSubscriptionStatus {
        didSet {
            if subscriptionStatus != oldValue {
                subscriptionStatusChangedDate = Date()
            }
            
            if subscriptionStatus == .subscribed, firstSubscribedDate == nil {
                firstSubscribedDate = Date()
            }
            
            userDefaults?.set(subscriptionStatus.rawValue, forKey: UserDefaultsKeys.subscriptionStatus)
        }
    }
    private(set) var subscriptionStatusChangedDate: Date? {
        didSet {
            userDefaults?.set(subscriptionStatusChangedDate, forKey: UserDefaultsKeys.subscriptionStatusChangeDate)
        }
    }
    private(set) var firstSubscribedDate: Date? {
        didSet {
            userDefaults?.set(firstSubscribedDate, forKey: UserDefaultsKeys.firstSubscribedDate)
        }
    }
    
    // MARK: Update properties
    
    private var updateCompletions: [() -> Void] = []
    private var lastUpdateRequestDate: Date?
    
    // MARK: Init
    
    init(
        userNotificationCenter: UNUserNotificationCenter,
        userDefaults: UserDefaults!
    ) {
        self.userNotificationCenter = userNotificationCenter
        self.userDefaults = userDefaults
        
        // Set stored properties
        
        self.isUserSubscribed = userDefaults.value(forKey: UserDefaultsKeys.isUserSubscribed) as? Bool
        if let rawValue = userDefaults.string(forKey: UserDefaultsKeys.subscriptionStatus),
            let subscriptionStatus = RECMessagingPushSubscriptionStatus(rawValue: rawValue) {
            self.subscriptionStatus = subscriptionStatus
        } else {
            self.subscriptionStatus = .nonSubscribed
        }
        self.subscriptionStatusChangedDate = userDefaults.value(forKey: UserDefaultsKeys.subscriptionStatusChangeDate) as? Date
        self.firstSubscribedDate = userDefaults.value(forKey: UserDefaultsKeys.firstSubscribedDate) as? Date
    }
    
    // MARK: User Subscription
    
    func setUserSubscription(_ isUserSubscribed: Bool) {
        self.isUserSubscribed = isUserSubscribed
        updateSubscriptionStatus()
    }
    
    // MARK: Subscription Status
    
    private func updateSubscriptionStatus(completion: @escaping () -> Void = {}) {
        let updateRequestDate = Date()
        lastUpdateRequestDate = updateRequestDate
        
        updateCompletions.append(completion)
        
        userNotificationCenter.getNotificationSettings { notificationSettings in
            guard self.lastUpdateRequestDate == updateRequestDate else {
                return
            }
            
            self.subscriptionStatus = RECMessagingPushSubscriptionStatus(authorizationStatus: notificationSettings.authorizationStatus,
                                                                     isUserSubscribed: self.isUserSubscribed)
            self.updateCompletions.forEach({ $0() })
            self.updateCompletions.removeAll()
            self.lastUpdateRequestDate = nil
        }
    }
    
    // MARK: Settings
    
    func getSettings(completion: @escaping (RECMessagingPushSubscriptionSettings) -> Void) {
        updateSubscriptionStatus {
            let settings = RECMessagingPushSubscriptionSettings(subscriptionStatus: self.subscriptionStatus,
                                                            isUserSubscribed: self.isUserSubscribed,
                                                            subscriptionStatusChangedDate: self.subscriptionStatusChangedDate,
                                                            firstSubscribedDate: self.firstSubscribedDate)
            
            completion(settings)
        }
    }
}
