//
//  RECDeviceWishlistUpdateActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceWishlistUpdateActivityData: RECDeviceActivityData {
    let wishlistHash: String
    let requestId: String?
    
    // MARK: Init
    
    init(
        wishlistHash: String,
        requestId: String?
    ) {
        self.wishlistHash = wishlistHash
        self.requestId = requestId
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case wishlistHash = "wishlist_hash"
        case requestId = "request_id"
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(wishlistHash, forKey: .wishlistHash)
        try container.encode(requestId, forKey: .requestId)
    }
}
