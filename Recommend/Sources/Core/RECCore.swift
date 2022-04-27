//
//  RECCore.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UIKit.UIDevice

public final class RECCore: NSObject {
    // MARK: UserDefauls
    
    private static let userDefaultsSuiteName = "pro.recommend.core"
    
    private struct UserDefaultsKeys {
        static let deviceId = "device_id"
        static let firstLaunch = "first_launch"
    }
    
    private lazy var userDefaults: UserDefaults! = {
        return UserDefaults(suiteName: Self.userDefaultsSuiteName)
    }()
    
    // MARK: - Properties
    
    public let config: RECConfig
    public let apiClient: RECAPIClient
    private let device: UIDevice
    
    private var identifierForVendorUUIDString: String? {
        return device.identifierForVendor?.uuidString
    }
    
    private var storedDeviceId: String? {
        get {
            userDefaults?.string(forKey: UserDefaultsKeys.deviceId)
        }
        set {
            userDefaults?.set(
                newValue,
                forKey: UserDefaultsKeys.deviceId)
        }
    }
    
    public private(set) var firstLaunch: Bool? {
        get {
            userDefaults?.value(forKey: UserDefaultsKeys.firstLaunch) as? Bool
        }
        set {
            userDefaults?.set(
                newValue,
                forKey: UserDefaultsKeys.firstLaunch)
        }
    }
    
    private var applicationWasLaunchedInSession: Bool = false
    
    // MARK: Init
    
    init(
        config: RECConfig,
        device: UIDevice = .current,
        urlSession: URLSession = .shared
    ) {
        self.config = config
        self.apiClient = RECAPIClient(
            host: config.apiHost,
            urlSession: urlSession)
        self.device = device
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
            throw RECCoreError.nilDeviceId
        }
        
        self.storedDeviceId = deviceId
        return deviceId
    }
    
    // MARK: Application
    
    func applicationLaunched() {
        guard applicationWasLaunchedInSession == false else {
            return
        }
        applicationWasLaunchedInSession = true
        
        if firstLaunch == nil {
            self.firstLaunch = true
        } else if firstLaunch == true {
            self.firstLaunch = false
        }
    }
}
