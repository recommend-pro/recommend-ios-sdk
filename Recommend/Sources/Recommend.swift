//
//  Recommend.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UIKit

public final class Recommend: NSObject {
    private let core: RECCore
    public let device: RECDevice
    public let recommendation: RECRecommendation
    public let messaging: RECMessaging
    
    // MARK: Shared singleton
    
    /// Shared instance. Call `initialize` before using.
    public private(set) static var shared: Recommend!
    
    /// Initialize `shared` instance.
    public static func initialize(appName: String,
                                  appId: String,
                                  apiHost: String = kRECDefaultAPIHost) {
        guard self.shared == nil else {
            return
        }
        self.shared = Self.init(appName: appName,
                                appId: appId,
                                apiHost: apiHost)
    }
    
    // MARK: Init
    
    public init(appName: String,
                appId: String,
                apiHost: String = kRECDefaultAPIHost) {
        let config = RECConfig(appName: appName,
                               appId: appId,
                               apiHost: apiHost)
        self.core = RECCore(config: config)
        self.device = RECDevice(core: core)
        self.recommendation = RECRecommendation(core: core)
        self.messaging = RECMessaging(core: core)
    }
    
    // MARK: Device Id
    
    public func deviceId() throws -> String {
        return try core.config.deviceId()
    }
    
    // MARK: Application
    
    public func application(_ application: UIApplication,
                            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        let isRemoteNotification = launchOptions?[.remoteNotification] as? [AnyHashable: Any] != nil

        if !(application.applicationState == .background && isRemoteNotification) {
            self.device.updateDevice()
            self.device.trackDeviceActivity(activity: [.openApp])
        }
    }
}
