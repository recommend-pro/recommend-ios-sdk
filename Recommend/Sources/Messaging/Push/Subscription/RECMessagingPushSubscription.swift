//
//  RECMessagingPushSubscription.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.03.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UserNotifications

final class RECMessagingPushSubscription {
    private(set) var status: RECMessagingPushSubscriptionStatus {
        didSet {
            let changeDate = Date()
            if status != oldValue {
                statusChangedDate = changeDate
            }
            if status == .subscribed, firstSubscribedDate == nil {
                firstSubscribedDate = changeDate
            }
        }
    }
    private(set) var isUserSubscribed: Bool?
    private(set) var statusChangedDate: Date?
    private(set) var firstSubscribedDate: Date?
    
    // MARK: Init
    
    private init(
        status: RECMessagingPushSubscriptionStatus,
        isUserSubscribed: Bool?,
        statusChangedData: Date?,
        firstSubscribedDate: Date?
    ) {
        self.status = status
        self.isUserSubscribed = isUserSubscribed
        self.statusChangedDate = statusChangedData
        self.firstSubscribedDate = firstSubscribedDate
    }
    
    // MARK: Update
    
    @discardableResult
    func update(
        authorizationStatus: UNAuthorizationStatus,
        isUserSubscribed: Bool? = nil
    ) -> Bool {
        if let isUserSubscribed = isUserSubscribed {
            self.isUserSubscribed = isUserSubscribed
        }
        
        let oldStatus = self.status
        self.status = RECMessagingPushSubscriptionStatus(
            authorizationStatus: authorizationStatus,
            isUserSubscribed: self.isUserSubscribed)
        
        return oldStatus != self.status
    }
}

extension RECMessagingPushSubscription {
    static func load(from userDefaults: UserDefaults) -> RECMessagingPushSubscription {
        RECMessagingPushSubscription(
            status: userDefaults.pushSubscriptionStatus ?? .nonSubscribed,
            isUserSubscribed: userDefaults.isUserSubscribedToPush,
            statusChangedData: userDefaults.pushSubscriptionStatusChangeDate,
            firstSubscribedDate: userDefaults.firstPushSubscribedStatusDate)
    }
    
    func save(to userDefaults: UserDefaults) {
        userDefaults.pushSubscriptionStatus = status
        userDefaults.isUserSubscribedToPush = isUserSubscribed
        userDefaults.pushSubscriptionStatusChangeDate = statusChangedDate
        userDefaults.firstPushSubscribedStatusDate = firstSubscribedDate
    }
}

fileprivate extension UserDefaults {
    private static let pushSubscriptionStatusKey: String = "PUSH_SUBSCRIPTION_STATUS"
    var pushSubscriptionStatus: RECMessagingPushSubscriptionStatus? {
        get {
            guard let rawValue = string(forKey: Self.pushSubscriptionStatusKey) else {
                return nil
            }
            return RECMessagingPushSubscriptionStatus(rawValue: rawValue)
        }
        set {
            set(newValue?.rawValue, forKey: Self.pushSubscriptionStatusKey)
        }
    }
    
    private static let isUserSubscribedToPushKey: String = "IS_USER_SUBSCRIBED_TO_PUSH"
    var isUserSubscribedToPush: Bool? {
        get {
            value(forKey: Self.isUserSubscribedToPushKey) as? Bool
        }
        set {
            set(newValue, forKey: Self.isUserSubscribedToPushKey)
        }
    }
    
    private static let pushSubscriptionStatusChangeDateKey: String = "PUSH_SUBSCRIPTION_STATUS_CHANGE_DATE"
    var pushSubscriptionStatusChangeDate: Date? {
        get {
            value(forKey: Self.pushSubscriptionStatusChangeDateKey) as? Date
        }
        set {
            set(newValue, forKey: Self.pushSubscriptionStatusChangeDateKey)
        }
    }
    
    private static let firstPushSubscribedStatusDateKey: String = "FIRST_PUSH_SUBSCRIBED_STATUS_DATE"
    var firstPushSubscribedStatusDate: Date? {
        get {
            value(forKey: Self.firstPushSubscribedStatusDateKey) as? Date
        }
        set {
            set(newValue, forKey: Self.firstPushSubscribedStatusDateKey)
        }
    }
}
