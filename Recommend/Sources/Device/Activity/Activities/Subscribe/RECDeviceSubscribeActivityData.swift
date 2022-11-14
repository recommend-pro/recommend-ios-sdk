//
//  RECDeviceSubscribeActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceSubscribeActivityData: RECDeviceActivityData {
    let emailHash: String
    let requestId: String?
    
    // MARK: Init
    
    init(
        emailHash: String,
        requestId: String?
    ) {
        self.emailHash = emailHash
        self.requestId = requestId
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case emailHash = "email_hash"
        case requestId = "request_id"
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(emailHash, forKey: .emailHash)
        try container.encode(requestId, forKey: .requestId)
        try super.encode(to: encoder)
    }
}
