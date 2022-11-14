//
//  RECDeviceUpdateDeviceActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceUpdateDeviceActivityData: RECDeviceActivityData {
    let model: String?
    let name: String?
    let firstLaunch: Int?
    let systemName: String = "iOS"
    let systemVersion: String?
    let appVersion: String?
    let deviceLanguage: String?
    let deviceCountry: String?
    let location: RECDeviceLocation?
    
    init(
        model: String?,
        name: String?,
        firstLaunch: Bool?,
        systemVersion: String?,
        appVersion: String?,
        deviceLanguage: String?,
        deviceCountry: String?,
        location: RECDeviceLocation?
    ) {
        self.model = model
        self.name = name
        self.firstLaunch = firstLaunch == true ? 1 : nil
        self.systemVersion = systemVersion
        self.appVersion = appVersion
        self.deviceLanguage = deviceLanguage
        self.deviceCountry = deviceCountry
        self.location = location
    }
    
    // MARK: Coding
    
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
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(model, forKey: .model)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(firstLaunch, forKey: .firstLaunch)
        try container.encode(systemName, forKey: .systemName)
        try container.encodeIfPresent(systemVersion, forKey: .systemVersion)
        try container.encodeIfPresent(appVersion, forKey: .appVersion)
        try container.encodeIfPresent(deviceLanguage, forKey: .deviceLanguage)
        try container.encodeIfPresent(deviceCountry, forKey: .deviceCountry)
        try container.encodeIfPresent(location, forKey: .location)
    }
}
