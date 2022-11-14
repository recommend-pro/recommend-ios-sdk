//
//  RECDeviceCheckoutActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceCheckoutActivity: RECDeviceActivityWithData {
    public init(
        step: String? = nil,
        option: String? = nil
    ) {
        let data = RECDeviceCheckoutActivityData(
            step: step,
            option: option)
        super.init(
            type: "checkout",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func checkout(
        step: String? = nil,
        option: String? = nil
    ) -> RECDeviceActivity {
        RECDeviceCheckoutActivity(
            step: step,
            option: option)
    }
}
