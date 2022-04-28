//
//  RECRemoveFromWishlistActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECRemoveFromWishlistActivity: RECActivity {
    let data: RECRemoveFromWishlistActivityData
    
    // MARK: Init
    
    public init(
        wishlistHash: String,
        sku: String,
        variationSKU: String?,
        requestId: String? = nil
    ) {
        self.data = RECRemoveFromWishlistActivityData(
            wishlistHash: wishlistHash,
            sku: sku,
            variationSKU: variationSKU,
            requestId: requestId)
        super.init(
            type: "remove_from_wishlist")
    }
}

// MARK: - Data

struct RECRemoveFromWishlistActivityData: Encodable {
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
