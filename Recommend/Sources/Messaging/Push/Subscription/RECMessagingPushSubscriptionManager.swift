//
//  RECMessagingPushSubscriptionManager.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.03.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UserNotifications

final class RECMessagingPushSubscriptionManager {
    private let userNotificationCenter: UNUserNotificationCenter
    private let userDefaults: UserDefaults
    private let subscription: RECMessagingPushSubscription
    var subscriptionAutoUpdated: ((RECMessagingPushSubscription) -> Void)?
    private var autoUpdateTimer: Timer!
    private var oneTimeForceUpdateFlag: Bool = false
    
    // MARK: Init
    
    init(
        userNotificationCenter: UNUserNotificationCenter,
        userDefaults: UserDefaults
    ) {
        self.userNotificationCenter = userNotificationCenter
        self.userDefaults = userDefaults
        self.subscription = .load(from: userDefaults)
        resetAutoUpdateTimer()
    }
    
    // MARK: Subscription Status
    
    private func updateSubscription(
        isUserSubscribed: Bool? = nil,
        completionHandler: @escaping (Bool) -> Void
    ) {
        userNotificationCenter.getNotificationSettings { notificationSettings in
            var result = self.subscription.update(
                authorizationStatus: notificationSettings.authorizationStatus,
                isUserSubscribed: isUserSubscribed)
            self.subscription.save(to: self.userDefaults)
            self.resetAutoUpdateTimer()
            
            if self.oneTimeForceUpdateFlag {
                result = true
                self.oneTimeForceUpdateFlag = false
            }
            completionHandler(result)
        }
    }
    
    func getSubscription(completionHandler: @escaping (RECMessagingPushSubscription) -> Void) {
        updateSubscription { _ in
            completionHandler(self.subscription)
        }
    }
    
    func setUserSubscription(
        _ isUserSubscribed: Bool,
        completionHandler: @escaping (RECMessagingPushSubscriptionUpdateResult) -> Void
    ) {
        updateSubscription(isUserSubscribed: isUserSubscribed) { isUpdated in
            let result = RECMessagingPushSubscriptionUpdateResult(
                subscription: self.subscription,
                isUpdated: isUpdated)
            completionHandler(result)
        }
    }
    
    // MARK: Timer
    
    private func resetAutoUpdateTimer() {
        // Main thread RunLoop for Timer
        DispatchQueue.main.async {
            self.autoUpdateTimer?.invalidate()
            
            let block: (Timer) -> Void = { [weak self] _ in
                guard let self = self else { return }
                self.updateSubscription { isUpdated in
                    guard isUpdated else { return }
                    self.subscriptionAutoUpdated?(self.subscription)
                }
            }
            
            self.autoUpdateTimer = Timer.scheduledTimer(
                withTimeInterval: 3600,
                repeats: true,
                block: block)
        }
    }
    
    // MARK: One-time force update
    
    func requestOneTimeForceUpdateForNext() {
        oneTimeForceUpdateFlag = true
    }
}
