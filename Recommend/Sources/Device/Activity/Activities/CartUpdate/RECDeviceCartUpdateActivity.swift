//
//  RECDeviceCartUpdateActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceCartUpdateActivity: RECDeviceActivityWithData {
    public init(
        cartHash: String,
        requestId: String? = nil,
        versionId: String? = nil
    ) {
        let data = RECDeviceCartUpdateActivityData(
            cartHash: cartHash,
            requestId: requestId,
            versionId: versionId)
        super.init(
            type: "cart_update",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func cartUpdate(
        cartHash: String,
        requestId: String? = nil,
        versionId: String? = nil
    ) -> RECDeviceActivity {
        RECDeviceCartUpdateActivity(
            cartHash: cartHash,
            requestId: requestId,
            versionId: versionId)
    }
}
