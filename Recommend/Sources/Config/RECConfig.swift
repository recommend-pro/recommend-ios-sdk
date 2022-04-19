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

// MARK: RECConfig

public final class RECConfig {
    
    // MARK: UserDefauls
    
    private static let userDefaultsSuiteName = "pro.recommend.configuration"
    private struct UserDefaultsKeys {
        static let deviceId = "device_id"
        static let firstLaunchDate = "first_launch_date"
    }
    
    private lazy var userDefaults: UserDefaults! = {
        return UserDefaults(suiteName: Self.userDefaultsSuiteName)
    }()
    
    // MARK: Properties
    
    public let accountId: String
    public let applicationName: String?
    public let apiHost: String
    
    private var storedDeviceId: String? {
        get {
            userDefaults?.string(forKey: UserDefaultsKeys.deviceId)
        }
        set {
            userDefaults?.set(newValue, forKey: UserDefaultsKeys.deviceId)
        }
    }
    
    public private(set) var firstLaunchDate: Date? {
        get {
            userDefaults?.value(forKey: UserDefaultsKeys.firstLaunchDate) as? Date
        }
        set {
            userDefaults?.set(newValue, forKey: UserDefaultsKeys.firstLaunchDate)
        }
    }
    
    private var identifierForVendorUUIDString: String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
    
    // MARK: Init
    
    init(
        accountId: String,
        applicationName: String?,
        apiHost: String = kRECDefaultAPIHost
    ) {
        self.accountId = accountId
        self.applicationName = applicationName
        self.apiHost = apiHost
    }
    
    // MARK: Device Id
    
    public func getDeviceId() throws -> String {
        if let storedDeviceId = self.storedDeviceId {
            if storedDeviceId.isEmpty == false {
                return storedDeviceId
            } else {
                self.storedDeviceId = nil
            }
        }
        
        guard
            let deviceId = self.identifierForVendorUUIDString,
            deviceId.isEmpty == false
        else {
            throw RECConfigError.nilDeviceId
        }
        
        self.storedDeviceId = deviceId
        return deviceId
    }
    
    // MARK: Open App
    
    func appLaunched() {
        guard self.firstLaunchDate == nil else {
            return
        }
        self.firstLaunchDate = Date()
    }
}
