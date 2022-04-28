//
//  RECRemoveFromCartActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECRemoveFromCartActivity: RECDataActivity<RECRemoveFromCartActivityData> {
    public init(
        cartHash: String,
        sku: String,
        variationSKU: String?,
        requestId: String? = nil
    ) {
        let data = RECRemoveFromCartActivityData(
            cartHash: cartHash,
            sku: sku,
            variationSKU: variationSKU,
            requestId: requestId)
        super.init(
            type: "remove_from_cart",
            data: data)
    }
}

// MARK: - Data

public struct RECRemoveFromCartActivityData: Encodable {
    public let cartHash: String
    public let sku: String
    public let variationSKU: String?
    @RECNullEncodable public private(set) var requestId: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case cartHash = "cart_hash"
        case sku
        case variationSKU = "variation_sku"
        case requestId = "request_id"
    }
}
