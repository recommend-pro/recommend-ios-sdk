//
//  RECWishlistUpdateActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECWishlistUpdateActivity: RECDataActivity<RECWishlistUpdateActivityData> {
    public init(
        wishlistHash: String,
        requestId: String? = nil
    ) {
        let data = RECWishlistUpdateActivityData(
            wishlistHash: wishlistHash,
            requestId: requestId)
        super.init(
            type: .wishlistUpdate,
            data: data)
    }
}

// MARK: - Data

public struct RECWishlistUpdateActivityData: Encodable {
    public let wishlistHash: String
    @RECNullEncodable public private(set) var requestId: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case wishlistHash = "wishlist_hash"
        case requestId = "request_id"
    }
}
