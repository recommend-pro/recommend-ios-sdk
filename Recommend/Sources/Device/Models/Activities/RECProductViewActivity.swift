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

struct RECProductViewActivityData: Encodable {
    let sku: String
    let variationSKU: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case sku
        case variationSKU = "variation_sku"
    }
}
