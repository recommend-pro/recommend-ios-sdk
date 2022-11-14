//
//  RECActivitySalewData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceSaleActivity: RECDeviceActivityWithData {
    public init(
        orderIdHash: String,
        requestId: String? = nil
    ) {
        let data = RECDeviceSaleActivityData(
            orderIdHash: orderIdHash,
            requestId: requestId)
        super.init(
            type: "sale",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func sale(
        orderIdHash: String,
        requestId: String? = nil
    ) -> RECDeviceActivity {
        RECDeviceSaleActivity(
            orderIdHash: orderIdHash,
            requestId: requestId)
    }
}
