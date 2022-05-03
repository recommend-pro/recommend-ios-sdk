//
//  RECCartUpdateActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECCartUpdateActivity: RECActivity {
    let data: RECCartUpdateActivityData
    
    // MARK: Init
    
    public init(
        cartHash: String,
        requestId: String? = nil
    ) {
        self.data = RECCartUpdateActivityData(
            cartHash: cartHash,
            requestId: requestId)
        super.init(
            type: "cart_update")
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

struct RECCartUpdateActivityData: Encodable {
    let cartHash: String
    @RECNullEncodable private(set) var requestId: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case cartHash = "cart_hash"
        case requestId = "request_id"
    }
}
