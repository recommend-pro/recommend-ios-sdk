//
//  RECActivityUpdateData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECActivityUpdateDeviceData: Encodable {
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
