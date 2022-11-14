//
//  RECDeviceProductViewActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceProductViewActivityData: RECDeviceActivityData {
    let sku: String
    let variationSKU: String?
    
    // MARK: Init
    
    init(
        sku: String,
        variationSKU: String?
    ) {
        self.sku = sku
        self.variationSKU = variationSKU
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case sku
        case variationSKU = "variation_sku"
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(sku, forKey: .sku)
        try container.encodeIfPresent(variationSKU, forKey: .variationSKU)
        try super.encode(to: encoder)
    }
}
