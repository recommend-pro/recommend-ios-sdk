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

final class RECDeviceUpdateDeviceActivity: RECDeviceActivity {
    typealias Location = RECDeviceLocation
    
    let data: RECDeviceUpdateDeviceActivityData

    // MARK: Init

    init(
        model: String?,
        name: String?,
        firstLaunch: Bool?,
        systemVersion: String?,
        appVersion: String?,
        deviceLanguage: String?,
        deviceCountry: String?,
        location: Location?
    ) {
        self.data = RECDeviceUpdateDeviceActivityData(
            model: model,
            name: name,
            firstLaunch: firstLaunch == true ? 1 : nil,
            systemVersion: systemVersion,
            appVersion: appVersion,
            deviceLanguage: deviceLanguage,
            deviceCountry: deviceCountry,
            location: location)
        super.init(type: "update_device")
    }
    
    // MARK: Encoding
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try super.encode(to: encoder)
    }
}

// MARK: - Data

struct RECDeviceUpdateDeviceActivityData: Encodable {
    typealias Location = RECDeviceLocation
    
    /// Model of device
    let model: String?
    /// Name of device
    let name: String?
    /// First launch of application. 0/1 boolean value
    let firstLaunch: Int?
    /// System name of device
    let systemName: String? = "iOS"
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
