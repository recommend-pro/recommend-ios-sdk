//
//  RECDeviceAddToCartActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceAddToCartActivity: RECDeviceActivity {
    let data: RECDeviceAddToCartActivityData
    
    // MARK: Init
    
    public init(
        cartHash: String,
        sku: String,
        variationSKU: String?,
        requestId: String? = nil
    ) {
        self.data = RECDeviceAddToCartActivityData(
            cartHash: cartHash,
            sku: sku,
            variationSKU: variationSKU,
            requestId: requestId)
        super.init(
            type: "add_to_cart")
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

struct RECDeviceAddToCartActivityData: Encodable {
    let cartHash: String
    let sku: String
    let variationSKU: String?
    @RECNullEncodable private(set) var requestId: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case cartHash = "cart_hash"
        case sku
        case variationSKU = "variation_sku"
        case requestId = "request_id"
    }
}
