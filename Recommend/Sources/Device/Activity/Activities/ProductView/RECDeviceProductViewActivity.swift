//
//  RECDeviceProductViewActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceProductViewActivity: RECDeviceActivityWithData {
    public init(
        sku: String,
        variationSKU: String? = nil
    ) {
        let data = RECDeviceProductViewActivityData(
            sku: sku,
            variationSKU: variationSKU)
        super.init(
            type: "product_view",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func productView(
        sku: String,
        variationSKU: String? = nil
    ) -> RECDeviceActivity {
        RECDeviceProductViewActivity(
            sku: sku,
            variationSKU: variationSKU)
    }
}
