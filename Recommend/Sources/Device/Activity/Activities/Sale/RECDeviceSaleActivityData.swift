//
//  RECDeviceSaleActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceSaleActivityData: RECDeviceActivityData {
    let orderIdHash: String
    let requestId: String?
    
    // MARK: Init
    
    init(
        orderIdHash: String,
        requestId: String?
    ) {
        self.orderIdHash = orderIdHash
        self.requestId = requestId
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case orderIdHash = "order_id_hash"
        case requestId = "request_id"
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(orderIdHash, forKey: .orderIdHash)
        try container.encode(requestId, forKey: .requestId)
        try super.encode(to: encoder)
    }
}
