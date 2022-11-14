//
//  RECDevicePanelViewActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDevicePanelViewActivity: RECDeviceActivityWithData {
    public init(
        products: [RECDeviceActivityProduct]? = nil,
        panelId: String,
        productsCount: Int
    ) {
        let data = RECDevicePanelViewActivityData(
            products: products,
            panelId: panelId,
            productsCount: productsCount)
        super.init(
            type: "panel_view",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func panelView(
        products: [RECDeviceActivityProduct]? = nil,
        panelId: String,
        productsCount: Int
    ) -> RECDeviceActivity {
        RECDevicePanelViewActivity(
            products: products,
            panelId: panelId,
            productsCount: productsCount)
    }
}
