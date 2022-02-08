//
//  RECConfig.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UIKit

public let kRECDefaultAPIHost = "api.recommend.pro"

public final class RECConfig {
    public let appName: String
    public let appId: String
    public let apiHost: String
    public let urlSession: URLSession
    private let userDefaults: RECConfigUserDefaults
    
    public var isFirstLaunch: Bool? {
        get {
            return userDefaults.isFirstLaunch
        }
        set {
            if (userDefaults.isFirstLaunch == nil && newValue == true) ||
                (userDefaults.isFirstLaunch != nil && newValue == false) {
                userDefaults.isFirstLaunch = newValue
            }
        }
    }
    
    private var identifierForVendorUUIDString: String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
    
    public func deviceId() throws -> String {
        if let storedDeviceId = userDefaults.deviceId {
            if storedDeviceId.isEmpty == false {
                return storedDeviceId
            } else {
                userDefaults.deviceId = nil
            }
        }
        
        guard
            let deviceId = self.identifierForVendorUUIDString,
            deviceId.isEmpty == false
        else {
            throw RECConfigError.nilDeviceId
        }
        
        self.userDefaults.deviceId = deviceId
        return deviceId
    }
    
    // MARK: Init
    
    init(appName: String,
         appId: String,
         apiHost: String = kRECDefaultAPIHost) {
        self.appName = appName
        self.appId = appId
        self.apiHost = apiHost
        self.urlSession = URLSession.shared
        self.userDefaults = RECConfigUserDefaults()
    }
}
