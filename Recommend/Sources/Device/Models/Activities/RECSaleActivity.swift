//
//  RECActivitySalewData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECSaleActivity: RECDataActivity<RECSaleActivityData> {
    public init(
        orderIdHash: String,
        requestId: String? = nil
    ) {
        let data = RECSaleActivityData(
            orderIdHash: orderIdHash,
            requestId: requestId)
        super.init(
            type: "sale",
            data: data)
    }
}

// MARK: - Data

public struct RECSaleActivityData: Encodable {
    public let orderIdHash: String
    @RECNullEncodable public private(set) var requestId: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case orderIdHash = "order_id_hash"
        case requestId = "request_id"
    }
}
