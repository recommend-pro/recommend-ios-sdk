//
//  RECActivityListViewData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 09.02.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceLinkDeviceActivity: RECDeviceActivityWithData {
    init(deviceIdsToLink: [String]) {
        let data = RECDeviceLinkDeviceActivityData(deviceIdsToLink: deviceIdsToLink)
        super.init(
            type: "link_device",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func linkDevice(deviceIdsToLink: [String]) -> RECDeviceActivity {
        RECDeviceLinkDeviceActivity(deviceIdsToLink: deviceIdsToLink)
    }
}
