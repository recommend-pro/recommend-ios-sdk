//
//  RECDeviceAddToWishlistActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceAddToWishlistActivity: RECDeviceActivity {
    let data: RECDeviceAddToWishlistActivityData
    
    // MARK: Init
    
    public init(
        wishlistHash: String,
        sku: String,
        variationSKU: String?,
        requestId: String? = nil
    ) {
        self.data = RECDeviceAddToWishlistActivityData(
            wishlistHash: wishlistHash,
            sku: sku,
            variationSKU: variationSKU,
            requestId: requestId)
        super.init(
            type: "add_to_wishlist")
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

struct RECDeviceAddToWishlistActivityData: Encodable {
    let wishlistHash: String
    let sku: String
    let variationSKU: String?
    @RECNullEncodable private(set) var requestId: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case wishlistHash = "wishlist_hash"
        case sku
        case variationSKU = "variation_sku"
        case requestId = "request_id"
    }
}
