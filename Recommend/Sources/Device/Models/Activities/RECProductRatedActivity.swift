//
//  RECProductRatedActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECProductRatedActivity: RECActivity {
    let data: RECProductRatedActivityData
    
    // MARK: Init
    
    public init(
        sku: String,
        rate: Int,
        variationSKU: String?
    ) {
        self.data = RECProductRatedActivityData(
            sku: sku,
            rate: rate,
            variationSKU: variationSKU)
        super.init(
            type: "product_rated")
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

struct RECProductRatedActivityData: Encodable {
    let sku: String
    let rate: Int
    let variationSKU: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case sku
        case rate
        case variationSKU = "variation_sku"
    }
    
    // MARK: Init
    
    init(
        sku: String,
        rate: Int,
        variationSKU: String?
    ) {
        self.sku = sku
        if rate < 0 {
            self.rate = 0
        } else if rate > 1 {
            self.rate = 1
        } else {
            self.rate = rate
        }
        self.variationSKU = variationSKU
    }
}
