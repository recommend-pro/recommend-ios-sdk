//
//  RECDeviceProductClickActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceProductClickActivity: RECDeviceActivityWithData {
    public init(
        sku: String,
        products: [RECDeviceActivityProduct]? = nil,
        source: RECDeviceProductClickActivitySource? = nil
    ) {
        let data = RECDeviceProductClickActivityData(
            sku: sku,
            products: products,
            source: source)
        super.init(
            type: "product_click",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func productClick(
        sku: String,
        products: [RECDeviceActivityProduct]? = nil,
        source: RECDeviceProductClickActivitySource? = nil
    ) -> RECDeviceActivity {
        RECDeviceProductClickActivity(
            sku: sku,
            products: products,
            source: source)
    }
}
