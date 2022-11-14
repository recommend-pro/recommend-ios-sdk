//
//  RECActivityUpdateData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceUpdateDeviceActivity: RECDeviceActivityWithData {
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
        let data = RECDeviceUpdateDeviceActivityData(
            model: model,
            name: name,
            firstLaunch: firstLaunch,
            systemVersion: systemVersion,
            appVersion: appVersion,
            deviceLanguage: deviceLanguage,
            deviceCountry: deviceCountry,
            location: location)
        super.init(
            type: "update_device",
            data: data)
    }
}

extension RECDeviceActivity {
    static func updateDevice(
        model: String?,
        name: String?,
        firstLaunch: Bool?,
        systemVersion: String?,
        appVersion: String?,
        deviceLanguage: String?,
        deviceCountry: String?,
        location: RECDeviceLocation?
    ) -> RECDeviceActivity {
        RECDeviceUpdateDeviceActivity(
            model: model,
            name: name,
            firstLaunch: firstLaunch,
            systemVersion: systemVersion,
            appVersion: appVersion,
            deviceLanguage: deviceLanguage,
            deviceCountry: deviceCountry,
            location: location)
    }
}
