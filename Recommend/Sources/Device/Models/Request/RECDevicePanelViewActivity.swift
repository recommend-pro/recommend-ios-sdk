//
//  RECDevicePanelViewActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDevicePanelViewActivity: RECDeviceActivity {
    let data: RECDevicePanelViewActivityData
    
    // MARK: Init
    
    public init(
        products: [RECDeviceActivityProduct]?,
        panelId: String,
        productsCount: Int
    ) {
        self.data = RECDevicePanelViewActivityData(
            products: products,
            panelId: panelId,
            productsCount: productsCount)
        super.init(
            type: "panel_view")
    }
    
    // MARK: Encoding
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try super.encode(to: encoder)
    }
}

// MARK: - Data

struct RECDevicePanelViewActivityData: Encodable {
    let products: [RECDeviceActivityProduct]?
    let panelId: String
    let productsCount: Int
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case products
        case panelId = "panel_id"
        case productsCount = "products_count"
    }
}
