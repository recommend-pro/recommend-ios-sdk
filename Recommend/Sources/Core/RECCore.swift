//
//  RECCore.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UIKit.UIDevice

final class RECCore {
    let device: UIDevice = .current
    let accountId: String
    let userDefaults: UserDefaults
    let customerInfo: RECCustomerInfo
    
    // MARK: Init
    
    init(configuration: RECConfiguration) {
        do {
            guard configuration.accountId.isEmpty == false else {
                throw RECInvalidAccountIdError()
            }
            self.accountId = configuration.accountId
            
            guard let userDefaults = UserDefaults(suiteName: "Recommend") else {
                throw RECInvalidUserDefaultsError()
            }
            self.userDefaults = userDefaults
            
            self.customerInfo = RECCustomerInfo(userDefaults: userDefaults)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    // MARK: Device Id
    
    func getDeviceId() throws -> String {
        let device = UIDevice.current
        
        if let storedDeviceId = userDefaults.deviceId {
            if storedDeviceId.isEmpty == false {
                return storedDeviceId
            } else {
                userDefaults.deviceId = nil
            }
        }
        
        let deviceId: String! = device.identifierForVendor?.uuidString
        
        guard deviceId?.isEmpty == false else {
            throw RECInvalidDeviceIdError(deviceId: deviceId)
        }

        userDefaults.deviceId = deviceId
        return deviceId
    }
    
    // MARK: First Launch
    
    private lazy var isFirstLaunch: Bool = {
        var isFirstLaunch: Bool!
        var newValue: Bool?
        
        if let value = userDefaults.isFirstLaunch {
            isFirstLaunch = value
        }
        
        if isFirstLaunch == nil {
            newValue = true
        } else if isFirstLaunch == true {
            newValue = false
        }
        
        if let newValue = newValue {
            isFirstLaunch = newValue
            userDefaults.isFirstLaunch = newValue
        }
        
        return isFirstLaunch
    }()
}

// MARK: - UserDefaults

fileprivate extension UserDefaults {
    private static let deviceIdKey = "DEVICE_ID"
    var deviceId: String? {
        get {
            string(forKey: Self.deviceIdKey)
        }
        set {
            set(newValue, forKey: Self.deviceIdKey)
        }
    }
    
    private static let isFirstLaunchKey = "IS_FIRST_LAUNCH"
    var isFirstLaunch: Bool? {
        get {
            value(forKey: Self.isFirstLaunchKey) as? Bool
        }
        set {
            set(newValue, forKey: Self.isFirstLaunchKey)
        }
    }
}
