//
//  Recommend.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UIKit.UIApplication

public final class Recommend {
    private var isConfigured: Bool = false
    private var core: RECCore!
    private var device: RECDevice!
    private var messaging: RECMessaging!
    private var recommendation: RECRecommendation!
    
    public var customerInfo: RECCustomerInfo! {
        core?.customerInfo
    }
    
    public var deviceId: String! {
        try? core?.getDeviceId()
    }
    
    public var pushNotificationOpenURLHandler: ((URL) -> Void)? {
        get {
            messaging?.pushNotificationOpenURLHandler
        }
        set {
            messaging?.pushNotificationOpenURLHandler = newValue
        }
    }
    
    public var isSubscribedToPushNotifications: Bool {
        messaging?.isSubscribedToPushNotifications ?? false
    }
    
    // MARK: Shared instance
    
    public static let shared = {
        Recommend()
    }()
    
    // MARK: Init
    
    private init() { }
    
    public convenience init(
        accountId: String,
        applicationName: String? = nil,
        apiHost: String = kRECAPIDefaultHost
    ) {
        self.init()
        let configuration = RECConfiguration(
            accountId: accountId,
            applicationName: applicationName,
            apiHost: apiHost)
        configure(with: configuration)
    }
    
    // MARK: Configure
    
    private func configure(with configuration: RECConfiguration) {
        guard isConfigured == false else {
            return
        }
        isConfigured = true
        self.core = RECCore(configuration: configuration)
        self.device = RECDevice(core: core)
        
        let messagingConfiguration = RECMessagingConfiguration(pushApplicationName: configuration.pushApplicationName)
        self.messaging = RECMessaging(
            core: core,
            configuration: messagingConfiguration)
        
        self.recommendation = RECRecommendation(core: core)
    }
    
    public static func configure() {
        do {
            let configuration = try RECConfiguration.loadFromPlist()
            shared.configure(with: configuration)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    public static func configure(
        accountId: String,
        applicationName: String? = nil,
        apiHost: String = kRECAPIDefaultHost
    ) {
        let configuration = RECConfiguration(
            accountId: accountId,
            applicationName: applicationName,
            apiHost: apiHost)
        shared.configure(with: configuration)
    }
    
    // MARK: Customer Info
    
    public func clearCustomerInfo() {
        core?.clearCustomerInfo()
    }
    
    // MARK: Device
    
    public func trackDeviceActivity(
        _ activity: [RECDeviceActivity],
        completionHandler: ((Error?) -> Void)? = nil
    ) {
        device.trackActivity(
            activity,
            completionHandler: completionHandler)
    }
    
    public func linkDevice(ids deviceIdsToLink: [String]) {
        device.linkDevice(ids: deviceIdsToLink)
    }
    
    // MARK: Messaging
    
    public static func isRecommendNotification(_ userInfo: [AnyHashable: Any]) -> Bool {
        RECMessagingPushManager.isRecommendNotification(userInfo)
    }
    
    public func isRecommendNotification(_ userInfo: [AnyHashable: Any]) -> Bool {
        Self.isRecommendNotification(userInfo)
    }
    
    public func setUserSubscriptionToPushNotifications(
        _ isUserSubscribed: Bool,
        completionHandler: ((Bool) -> Void)? = nil
    ) {
        messaging?.setUserSubscriptionToPushNotifications(
            isUserSubscribed,
            completionHandler: completionHandler)
    }
    
    @available(*, deprecated, renamed: "setUserSubscriptionToPushNotifications")
    public func subscribeToPushMessaging() {
        messaging?.setUserSubscriptionToPushNotifications(true)
    }
    
    @available(*, deprecated, renamed: "setUserSubscriptionToPushNotifications")
    public func unsubscribeFromPushMessaging() {
        messaging?.setUserSubscriptionToPushNotifications(false)
    }
    
    // MARK: Recommendation
    
    public func fetchRecommendationPanels(
        panels: [RECRecommendationPanelRequest]? = nil,
        previewPanel: RECRecommendationPreviewPanelRequest? = nil,
        pageType: String? = nil,
        completionHandler: @escaping (Result<[RECRecommendationPanel], Error>) -> Void
    ) {
        guard let recommendation = self.recommendation else {
            completionHandler(.success([]))
            return
        }
        recommendation.fetchPanels(
            panels: panels,
            previewPanel: previewPanel,
            pageType: pageType,
            completionHandler: completionHandler)
    }
    
    // MARK: Application
    
    public func application(
        _ application: UIKit.UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIKit.UIApplication.LaunchOptionsKey: Any]?
    ) {
        let isRemoteNotification = launchOptions?[.remoteNotification] as? [AnyHashable: Any] != nil
        
        if !(application.applicationState == .background && isRemoteNotification) {
            device?.applicationDidFinishLaunching()
        }
    }
    
    public func application(
        _ application: UIKit.UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        messaging?.application(
            application,
            didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
    
    public func application(
        _ application: UIKit.UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable: Any]
    ) {
        messaging?.application(
            application,
            didReceiveRemoteNotification: userInfo)
    }
    
    // MARK: User Notifications
    
    public func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse
    ) {
        messaging?.userNotificationCenter(
            center,
            didReceive: response)
    }
}
