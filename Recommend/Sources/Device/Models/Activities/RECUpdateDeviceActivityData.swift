//
//  RECActivityUpdateData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

public final class RECUpdateDeviceActivity: RECActivity {
    public typealias ActivityData = RECUpdateDeviceActivityData
    public typealias SystemName = RECDeviceSystemName
    public typealias Location = RECDeviceLocation
    
    public let data: ActivityData
    
    // MARK: Init
    
    public init(
        model: String?,
        name: String?,
        firstLaunch: Int?,
        systemName: SystemName?,
        systemVersion: String?,
        appVersion: String?,
        deviceLanguage: String?,
        deviceCountry: String?,
        location: Location?
    ) {
        self.data = ActivityData(model: model,
                                 name: name,
                                 firstLaunch: firstLaunch,
                                 systemName: systemName,
                                 systemVersion: systemVersion,
                                 appVersion: appVersion,
                                 deviceLanguage: deviceLanguage,
                                 deviceCountry: deviceCountry,
                                 location: location)
        super.init(type: .updateDevice)
    }
    
    // MARK: Default
    
    static func `default`(firstLaunch: Bool? = nil) -> RECUpdateDeviceActivity {
        let device = UIDevice.current
        let bundle = Bundle.main
        let locale = Locale.current
        
        return .init(model: device.model,
                     name: device.name,
                     firstLaunch: firstLaunch?.intValue,
                     systemName: .iOS,
                     systemVersion: device.systemVersion,
                     appVersion: bundle.bundleShortVersionString,
                     deviceLanguage: locale.languageCode,
                     deviceCountry: locale.regionCode,
                     location: .default())
    }
}

// MARK: - Data

public struct RECUpdateDeviceActivityData: Encodable {
    public typealias SystemName = RECDeviceSystemName
    public typealias Location = RECDeviceLocation
    
    /// Model of device
    public let model: String?
    /// Name of device
    public let name: String?
    /// First launch of application
    public var firstLaunch: Int?
    /// System name of device
    public let systemName: SystemName?
    /// System version of device
    public let systemVersion: String?
    /// Application version of device
    public let appVersion: String?
    /// Device language
    public let deviceLanguage: String?
    /// Device country
    public let deviceCountry: String?
    /// Location of device
    public let location: Location?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case model
        case name
        case firstLaunch = "first_launch"
        case systemName = "system_name"
        case systemVersion = "system_version"
        case appVersion = "app_version"
        case deviceLanguage = "device_language"
        case deviceCountry = "device_country"
        case location
    }
}
