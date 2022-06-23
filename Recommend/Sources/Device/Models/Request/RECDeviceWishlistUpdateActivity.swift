//
//  RECDeviceWishlistUpdateActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceWishlistUpdateActivity: RECDeviceActivity {
    let data: RECDeviceWishlistUpdateActivityData
    
    // MARK: Init
    
    public init(
        wishlistHash: String,
        requestId: String? = nil
    ) {
        self.data = RECDeviceWishlistUpdateActivityData(
            wishlistHash: wishlistHash,
            requestId: requestId)
        super.init(type: "wishlist_update")
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

struct RECDeviceWishlistUpdateActivityData: Encodable {
    let wishlistHash: String
    @RECNullEncodable private(set) var requestId: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case wishlistHash = "wishlist_hash"
        case requestId = "request_id"
    }
}
