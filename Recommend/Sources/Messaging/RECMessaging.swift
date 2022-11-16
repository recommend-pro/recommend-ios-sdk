//
//  RECMessaging.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UIKit.UIApplication

final class RECMessaging: NSObject {
    private let apiService: RECMessagingAPIService
    private let pushManager: RECMessagingPushManager?
    
    private var wrappedPushManager: RECMessagingPushManager? {
        if pushManager == nil {
            // let error = RECMessagingNilApplicationNameError()
            // debugPrint("Error: \(error.errorDescription ?? "")")
        }
        return pushManager
    }
    
    var pushNotificationOpenURLHandler: ((URL) -> Void)? {
        get {
            pushManager?.openURLHandler
        }
        set {
            pushManager?.openURLHandler = newValue
        }
    }
    
    // MARK: Init
    
    init(
        core: RECCore,
        configuration: RECMessagingConfiguration
    ) {
        self.apiService = RECMessagingAPIService(core: core)
        if let applicationName = configuration.pushApplicationName {
            self.pushManager = RECMessagingPushManager(
                apiService: apiService,
                userDefaults: core.userDefaults,
                applicationName: applicationName)
        } else {
            self.pushManager = nil
        }
    }
    
    // MARK: Push Messaging
    
    func subscribeToPush() {
        wrappedPushManager?.subscribe()
    }
    
    func unsubscribeFromPush() {
        wrappedPushManager?.unsubscribe()
    }
    
    func application(
        _ application: UIKit.UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        wrappedPushManager?.setToken(deviceToken)
    }
    
    func application(
        _ application: UIKit.UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable: Any]
    ) {
        wrappedPushManager?.handleReceivedRemoteNotification(userInfo)
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse
    ) {
        wrappedPushManager?.handleReceivedNotificationResponse(response)
    }
}
