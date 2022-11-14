//
//  RECDeviceProductRatedActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceProductRatedActivityData: RECDeviceActivityData {
    let sku: String
    let variationSKU: String?
    let rate: Int
    
    // MARK: Init
    
    init(
        sku: String,
        variationSKU: String?,
        rate: Int
    ) {
        self.sku = sku
        self.variationSKU = variationSKU
        if rate < 0 {
            self.rate = 0
        } else if rate > 1 {
            self.rate = 1
        } else {
            self.rate = rate
        }
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case sku
        case variationSKU = "variation_sku"
        case rate
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(sku, forKey: .sku)
        try container.encodeIfPresent(variationSKU, forKey: .variationSKU)
        try container.encode(rate, forKey: .rate)
        try super.encode(to: encoder)
    }
}
