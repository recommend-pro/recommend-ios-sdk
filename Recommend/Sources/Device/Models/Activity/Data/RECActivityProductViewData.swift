//
//  RECActivityProductViewData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECActivityProductViewData: Encodable {
    public let sku: String
    public let variationSKU: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case sku
        case variationSKU = "variation_sku"
    }
    
    // MARK: Init
    
    public init(
        sku: String,
        variationSKU: String?
    ) {
        self.sku = sku
        self.variationSKU = variationSKU
    }
}
