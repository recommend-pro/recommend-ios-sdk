//
//  RECActivityPanelViewData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECActivityPanelViewData: Encodable {
    public let products: [RECActivityProduct]?
    public let panelId: String
    public let productsCount: Int
    
    enum CodingKeys: String, CodingKey {
        case products
        case panelId = "panel_id"
        case productsCount = "products_count"
    }
}
