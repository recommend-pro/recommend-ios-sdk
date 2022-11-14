//
//  RECDevicePanelViewActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDevicePanelViewActivityData: RECDeviceActivityData {
    let products: [RECDeviceActivityProduct]?
    let panelId: String
    let productsCount: Int
    
    // MARK: Init
    
    init(
        products: [RECDeviceActivityProduct]?,
        panelId: String,
        productsCount: Int
    ) {
        self.products = products
        self.panelId = panelId
        self.productsCount = productsCount
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case products
        case panelId = "panel_id"
        case productsCount = "products_count"
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(products, forKey: .products)
        try container.encode(panelId, forKey: .panelId)
        try container.encode(productsCount, forKey: .productsCount)
        try super.encode(to: encoder)
    }
}
