//
//  RECRemoveFromWishlistActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECRemoveFromWishlistActivity: RECActivity {
    public typealias ActivityData = RECRemoveFromWishlistActivityData
    
    public let data: ActivityData
    
    // MARK: Init
    
    public init(
        wishlistHash: String,
        sku: String,
        variationSKU: String?,
        requestId: String? = nil
    ) {
        self.data = ActivityData(wishlistHash: wishlistHash,
                                 sku: sku,
                                 variationSKU: variationSKU,
                                 requestId: requestId)
        super.init(type: .removeFromWishlist)
    }
}

// MARK: - Data

public struct RECRemoveFromWishlistActivityData: Encodable {
    public let wishlistHash: String
    public let sku: String
    public let variationSKU: String?
    @RECNullEncodable public private(set) var requestId: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case wishlistHash = "wishlist_hash"
        case sku
        case variationSKU = "variation_sku"
        case requestId = "request_id"
    }
}