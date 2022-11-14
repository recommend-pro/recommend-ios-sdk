//
//  RECDeviceProductRatedActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceProductRatedActivity: RECDeviceActivityWithData {
    public init(
        sku: String,
        variationSKU: String? = nil,
        rate: Int
    ) {
        let data = RECDeviceProductRatedActivityData(
            sku: sku,
            variationSKU: variationSKU,
            rate: rate)
        super.init(
            type: "product_rated",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func productRated(
        sku: String,
        variationSKU: String? = nil,
        rate: Int
    ) -> RECDeviceActivity {
        RECDeviceProductRatedActivity(
            sku: sku,
            variationSKU: variationSKU,
            rate: rate)
    }
}
