//
//  RECActivitySalewData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECSaleActivity: RECActivity {
    let data: RECSaleActivityData
    
    // MARK: Init
    
    public init(
        orderIdHash: String,
        requestId: String? = nil
    ) {
        self.data = RECSaleActivityData(
            orderIdHash: orderIdHash,
            requestId: requestId)
        super.init(type: "sale")
    }
}

// MARK: - Data

struct RECSaleActivityData: Encodable {
    let orderIdHash: String
    @RECNullEncodable private(set) var requestId: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case orderIdHash = "order_id_hash"
        case requestId = "request_id"
    }
}
