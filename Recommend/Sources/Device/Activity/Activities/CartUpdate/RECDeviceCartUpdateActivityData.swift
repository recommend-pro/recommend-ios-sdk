//
//  RECDeviceCartUpdateActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceCartUpdateActivityData: RECDeviceActivityData {
    let cartHash: String
    let requestId: String?
    let versionId: String?
    
    // MARK: Init
    
    init(
        cartHash: String,
        requestId: String?,
        versionId: String?
    ) {
        self.cartHash = cartHash
        self.requestId = requestId
        self.versionId = versionId
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case cartHash = "cart_hash"
        case requestId = "request_id"
        case versionId = "version_id"
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(cartHash, forKey: .cartHash)
        try container.encodeIfPresent(requestId, forKey: .requestId)
        try container.encodeIfPresent(versionId, forKey: .versionId)
    }
}
