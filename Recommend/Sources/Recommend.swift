//
//  Recommend.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UIKit.UIApplication

public final class Recommend: NSObject {
    private let config: RECConfig
    private let apiClient: RECAPIClient
    
    public var deviceId: String? {
        return try? config.getDeviceId()
    }
    
    // MARK: Init
    
    public init(
        accountId: String,
        applicationName: String? = nil,
        apiHost: String = kRECDefaultAPIHost
    ) {
        self.config = RECConfig(
            accountId: accountId,
            applicationName: applicationName,
            apiHost: apiHost)
        
        self.apiClient = RECAPIClient(
            host: apiHost,
            urlSession: .shared)
    }
    
    // MARK: Application

    public func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) {
        let isRemoteNotification = launchOptions?[.remoteNotification] as? [AnyHashable: Any] != nil
        
        if !(application.applicationState == .background && isRemoteNotification) {
            self.config.appLaunched()
        }
    }
}
