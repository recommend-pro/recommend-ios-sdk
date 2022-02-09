//
//  RECActivityWishlistUpdateData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECActivityWishlistUpdateData: Encodable {
    public let wishlistHash: String
    @RECNullEncodable public private(set) var requestId: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case wishlistHash = "wishlist_hash"
        case requestId = "request_id"
    }
    
    // MARK: Init
    
    public init(
        wishlistHash: String,
        requestId: String? = nil
    ) {
        self.wishlistHash = wishlistHash
        self.requestId = requestId
    }
}
