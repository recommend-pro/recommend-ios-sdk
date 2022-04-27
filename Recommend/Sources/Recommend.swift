//
//  Recommend.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UIKit.UIApplication
import UserNotifications

public final class Recommend: NSObject {
    private let core: RECCore
    private let device: RECDevice
    private let recommendation: RECRecommendation
    private let messaging: RECMessaging
    
    public var deviceId: String? {
        return try? core.getDeviceId()
    }
     
    // MARK: Shared instance
    
    /// Shared instance. Call `initialize` before using.
    public private(set) static var shared: Recommend!
    
    /// Initialize `shared` instance.
    @discardableResult
    public static func initialize(
        accountId: String,
        applicationName: String? = nil,
        apiHost: String = kRECDefaultAPIHost
    ) -> Recommend! {
        guard self.shared == nil else {
            return shared
        }
        
        self.shared = Self.init(
            accountId: accountId,
            applicationName: applicationName,
            apiHost: apiHost)
        return self.shared
    }
    
    // MARK: Init
    
    public init(
        config: RECConfig
    ) {
        self.core = RECCore(
            config: config,
            device: .current,
            urlSession: .shared)
        self.device = RECDevice(core: core)
        self.recommendation = RECRecommendation(core: core)
        self.messaging = RECMessaging(core: core)
    }
    
    public convenience init(
        accountId: String,
        applicationName: String? = nil,
        apiHost: String = kRECDefaultAPIHost
    ) {
        let config = RECConfig(
            accountId: accountId,
            applicationName: applicationName,
            apiHost: apiHost)
        self.init(config: config)
    }
    
    // MARK: Application

    public func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) {
        let isRemoteNotification = launchOptions?[.remoteNotification] as? [AnyHashable: Any] != nil
        
        if !(application.applicationState == .background && isRemoteNotification) {
            self.core.applicationLaunched()
            self.device.trackUpdateDevice()
            self.device.trackOpenApp()
        }
    }
    
    public func applicationWillResignActive() {
        self.device.trackOpenApp()
    }
    
    // MARK: Device Activity
    
    public func trackDeviceActivity(
        _ deviceActivity: RECDeviceActivity
    ) {
        device.trackDeviceActivity(deviceActivity)
    }
    
    // MARK: Fetch Recommendation Panels
    
    public func fetchPanels(
        with model: RECRecommendationPanelsFetchModel,
        completion: @escaping (Result<[RECRecommendationPanel], Error>) -> Void
    ) {
        recommendation.fetchPanels(
            with: model,
            completion: completion)
    }
    
    // MARK: Messaging
    
    public func isRecommendNotification(_ userInfo: [AnyHashable: Any]) -> Bool {
        return messaging.isRecommendNotification(userInfo)
    }
    
    public func remoteNotificationOpenURL(_ userInfo: [AnyHashable: Any]) -> URL? {
        return messaging.remoteNotificationOpenURL(userInfo)
    }
    
    public func setDeviceToken(_ deviceToken: Data) {
        messaging.setDeviceToken(deviceToken)
    }
    
    public func subscribeToPushNotifications() {
        messaging.subscribeToPushNotifications()
    }
    
    public func unsubscribeFromPushNotifications() {
        messaging.unsubscribeFromPushNotifications()
    }
    
    public func applicationDidReceiveRemoteNotification(_ userInfo: [AnyHashable: Any]) {
        messaging.applicationDidReceiveRemoteNotification(userInfo)
    }
    
    // MARK: User Notifications
    
    public func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse
    ) {
        messaging.userNotificationCenter(center, didReceive: response)
    }
}
