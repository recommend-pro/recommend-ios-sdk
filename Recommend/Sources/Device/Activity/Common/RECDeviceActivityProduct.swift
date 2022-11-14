//
//  RECDeviceActivityProduct.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECDeviceActivityProduct: Encodable {
    public let sku: String
    public let variationSKU: String?
    public let position: Int?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case sku
        case variationSKU = "variation_sku"
        case position
    }
    
    // MARK: Init
    
    public init(
        sku: String,
        variationSKU: String?,
        position: Int?
    ) {
        self.sku = sku
        self.variationSKU = variationSKU
        self.position = position
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(sku, forKey: .sku)
        try container.encodeIfPresent(variationSKU, forKey: .variationSKU)
        try container.encodeIfPresent(position, forKey: .position)
    }
}
