//
//  RECDeviceProductClickActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceProductClickActivityData: RECDeviceActivityData {
    let sku: String
    let products: [RECDeviceActivityProduct]?
    let source: RECDeviceProductClickActivitySource?
    
    // MARK: Init
    
    init(
        sku: String,
        products: [RECDeviceActivityProduct]?,
        source: RECDeviceProductClickActivitySource?
    ) {
        self.sku = sku
        self.products = products
        self.source = source
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case sku
        case products
        case source
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(sku, forKey: .sku)
        try container.encodeIfPresent(products, forKey: .products)
        try container.encodeIfPresent(source, forKey: .source)
        try super.encode(to: encoder)
    }
}
