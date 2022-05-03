//
//  RECProductViewActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECProductViewActivity: RECActivity {
    let data: RECProductViewActivityData
    
    // MARK: Init
    
    public init(
        sku: String,
        variationSKU: String?
    ) {
        self.data = RECProductViewActivityData(
            sku: sku,
            variationSKU: variationSKU)
        super.init(
            type: "product_view")
    }
}

// MARK: - Data

struct RECProductViewActivityData: Encodable {
    let sku: String
    let variationSKU: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case sku
        case variationSKU = "variation_sku"
    }
}
