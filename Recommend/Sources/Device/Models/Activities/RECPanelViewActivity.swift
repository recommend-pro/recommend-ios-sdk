//
//  RECPanelViewActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECPanelViewActivity: RECActivity {
    let data: RECPanelViewActivityData
    
    // MARK: Init
    
    public init(
        products: [RECActivityProduct]?,
        panelId: String,
        productsCount: Int
    ) {
        self.data = RECPanelViewActivityData(
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

struct RECPanelViewActivityData: Encodable {
    let products: [RECActivityProduct]?
    let panelId: String
    let productsCount: Int
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case products
        case panelId = "panel_id"
        case productsCount = "products_count"
    }
}
