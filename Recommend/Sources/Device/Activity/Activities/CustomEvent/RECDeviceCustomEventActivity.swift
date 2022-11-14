//
//  RECDeviceCustomEventActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceCustomEventActivity: RECDeviceActivityWithData {
    public init(event: String) {
        let data = RECDeviceCustomEventActivityData(event: event)
        super.init(
            type: "custom_event",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func customEvent(event: String) -> RECDeviceActivity {
        RECDeviceCustomEventActivity(event: event)
    }
}
