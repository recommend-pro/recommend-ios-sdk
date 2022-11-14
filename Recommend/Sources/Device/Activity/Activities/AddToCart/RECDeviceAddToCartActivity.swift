//
//  RECDeviceAddToCartActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceAddToCartActivity: RECDeviceActivityWithData {
    public init(
        cartHash: String,
        sku: String,
        variationSKU: String? = nil,
        requestId: String? = nil
    ) {
        let data = RECDeviceAddToCartActivityData(
            cartHash: cartHash,
            sku: sku,
            variationSKU: variationSKU,
            requestId: requestId)
        super.init(
            type: "add_to_cart",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func addToCart(
        cartHash: String,
        sku: String,
        variationSKU: String? = nil,
        requestId: String? = nil
    ) -> RECDeviceActivity {
        RECDeviceAddToCartActivity(
            cartHash: cartHash,
            sku: sku,
            variationSKU: variationSKU,
            requestId: requestId)
    }
}
