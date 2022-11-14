//
//  RECActivitySuscribeData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceSubscribeActivity: RECDeviceActivityWithData {
    public init(
        emailHash: String,
        requestId: String? = nil
    ) {
        let data = RECDeviceSubscribeActivityData(
            emailHash: emailHash,
            requestId: requestId)
        super.init(
            type: "subscribe",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func subscribe(
        emailHash: String,
        requestId: String? = nil
    ) -> RECDeviceActivity {
        RECDeviceSubscribeActivity(
            emailHash: emailHash,
            requestId: requestId)
    }
}
