//
//  RECDeviceRemoveFromCartActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceRemoveFromCartActivity: RECDeviceActivityWithData {
    public init(
        cartHash: String,
        sku: String,
        variationSKU: String? = nil,
        requestId: String? = nil
    ) {
        let data = RECDeviceRemoveFromCartActivityData(
            cartHash: cartHash,
            sku: sku,
            variationSKU: variationSKU,
            requestId: requestId)
        super.init(
            type: "remove_from_cart",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func removeFromCart(
        cartHash: String,
        sku: String,
        variationSKU: String? = nil,
        requestId: String? = nil
    ) -> RECDeviceActivity {
        RECDeviceRemoveFromCartActivity(
            cartHash: cartHash,
            sku: sku,
            variationSKU: variationSKU,
            requestId: requestId)
    }
}
