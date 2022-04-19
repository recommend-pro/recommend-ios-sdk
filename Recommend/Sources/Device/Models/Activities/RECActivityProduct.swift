//
//  RECActivityProduct.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECActivityProduct: Encodable {
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
}
