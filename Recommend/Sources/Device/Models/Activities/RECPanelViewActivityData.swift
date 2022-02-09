//
//  RECPanelViewActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECPanelViewActivity: RECActivity {
    public typealias ActivityData = RECPanelViewActivityData

    public let data: ActivityData

    // MARK: Init

    public init(
        products: [RECActivityProduct]?,
        panelId: String,
        productsCount: Int
    ) {
        self.data = ActivityData(products: products,
                                 panelId: panelId,
                                 productsCount: productsCount)
        super.init(type: .panelView)
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
