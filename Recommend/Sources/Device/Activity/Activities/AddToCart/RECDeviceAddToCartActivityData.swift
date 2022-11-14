//
//  RECDeviceAddToCartActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceAddToCartActivityData: RECDeviceActivityData {
    let cartHash: String
    let sku: String
    let variationSKU: String?
    let requestId: String?
    
    // MARK: Init
    
    init(
        cartHash: String,
        sku: String,
        variationSKU: String?,
        requestId: String?
    ) {
        self.cartHash = cartHash
        self.sku = sku
        self.variationSKU = variationSKU
        self.requestId = requestId
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case cartHash = "cart_hash"
        case sku
        case variationSKU = "variation_sku"
        case requestId = "request_id"
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(cartHash, forKey: .cartHash)
        try container.encodeIfPresent(sku, forKey: .sku)
        try container.encodeIfPresent(variationSKU, forKey: .variationSKU)
        try container.encode(requestId, forKey: .requestId)
    }
}
