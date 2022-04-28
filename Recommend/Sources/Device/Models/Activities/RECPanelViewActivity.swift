//
//  RECPanelViewActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECPanelViewActivity: RECDataActivity<RECPanelViewActivityData> {
    public init(
        products: [RECActivityProduct]?,
        panelId: String,
        productsCount: Int
    ) {
        let data = RECPanelViewActivityData(
            products: products,
            panelId: panelId,
            productsCount: productsCount)
        super.init(
            type: .panelView,
            data: data)
    }
}

// MARK: - Data

public struct RECPanelViewActivityData: Encodable {
    public let products: [RECActivityProduct]?
    public let panelId: String
    public let productsCount: Int
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case products
        case panelId = "panel_id"
        case productsCount = "products_count"
    }
}
