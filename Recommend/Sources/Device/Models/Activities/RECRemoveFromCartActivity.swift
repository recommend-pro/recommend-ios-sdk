//
//  RECRemoveFromCartActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECRemoveFromCartActivity: RECActivity {
    let data: RECRemoveFromCartActivityData
    
    // MARK: Init
    
    public init(
        cartHash: String,
        sku: String,
        variationSKU: String?,
        requestId: String? = nil
    ) {
        self.data = RECRemoveFromCartActivityData(
            cartHash: cartHash,
            sku: sku,
            variationSKU: variationSKU,
            requestId: requestId)
        super.init(
            type: "remove_from_cart")
    }
}

// MARK: - Data

struct RECRemoveFromCartActivityData: Encodable {
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
