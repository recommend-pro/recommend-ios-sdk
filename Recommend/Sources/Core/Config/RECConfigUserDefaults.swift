//
//  RECConfigUserDefaults.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

private let kRECConfigUserDefaultsSuiteName = "pro.recommend.configuration"

// MARK: RECConfigUserDefaults Keys

private struct RECConfigUserDefaultsKeys {
    private static var suiteName: String {
        return kRECConfigUserDefaultsSuiteName
    }
    
    static let deviceId = suiteName + ".device_id"
    static let isFirstLaunch = suiteName + ".is_first_launch"
}

// MARK: RECConfigUserDefaults

final class RECConfigUserDefaults: NSObject {
    private typealias Keys = RECConfigUserDefaultsKeys
    
    private lazy var userDefaults: UserDefaults! = {
        return UserDefaults(suiteName: kRECConfigUserDefaultsSuiteName)
    }()
    
    var deviceId: String? {
        get {
            userDefaults?.string(forKey: Keys.deviceId)
        }
        set {
            userDefaults?.set(newValue, forKey: Keys.deviceId)
            userDefaults?.synchronize()
        }
    }
    
    var isFirstLaunch: Bool? {
        get {
            return userDefaults?.value(forKey: Keys.isFirstLaunch) as? Bool
        }
        set {
            userDefaults?.set(newValue, forKey: Keys.isFirstLaunch)
            userDefaults?.synchronize()
        }
    }
}
