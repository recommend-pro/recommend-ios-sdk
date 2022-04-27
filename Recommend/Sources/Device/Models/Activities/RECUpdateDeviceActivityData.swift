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

final class RECUpdateDeviceActivity: RECDataActivity<RECUpdateDeviceActivityData> {
    typealias SystemName = RECDeviceSystemName
    typealias Location = RECDeviceLocation

    // MARK: Init

    init(
        model: String?,
        name: String?,
        firstLaunch: Bool?,
        systemName: SystemName?,
        systemVersion: String?,
        appVersion: String?,
        deviceLanguage: String?,
        deviceCountry: String?,
        location: Location?
    ) {
        let data = RECUpdateDeviceActivityData(
            model: model,
            name: name,
            firstLaunch: firstLaunch == true ? true : nil,
            systemName: systemName,
            systemVersion: systemVersion,
            appVersion: appVersion,
            deviceLanguage: deviceLanguage,
            deviceCountry: deviceCountry,
            location: location)
        super.init(
            type: .updateDevice,
            data: data)
    }
    
    // MARK: Default
    
    static func `default`(firstLaunch: Bool? = nil) -> RECUpdateDeviceActivity {
        let device = UIDevice.current
        let bundle = Bundle.main
        let locale = Locale.current
        
        return .init(model: device.model,
                     name: device.name,
                     firstLaunch: firstLaunch,
                     systemName: .iOS,
                     systemVersion: device.systemVersion,
                     appVersion: bundle.bundleShortVersionString,
                     deviceLanguage: locale.languageCode,
                     deviceCountry: locale.regionCode,
                     location: .default())
    }
}

// MARK: - Data

struct RECUpdateDeviceActivityData: Encodable {
    typealias SystemName = RECDeviceSystemName
    typealias Location = RECDeviceLocation
    
    /// Model of device
    let model: String?
    /// Name of device
    let name: String?
    /// First launch of application.
    let firstLaunch: Bool?
    /// System name of device
    let systemName: SystemName?
    /// System version of device
    let systemVersion: String?
    /// Application version of device
    let appVersion: String?
    /// Device language
    let deviceLanguage: String?
    /// Device country
    let deviceCountry: String?
    /// Location of device
    let location: Location?
    
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
