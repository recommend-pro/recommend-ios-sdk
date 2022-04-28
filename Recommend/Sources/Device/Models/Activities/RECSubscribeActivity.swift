//
//  RECActivitySuscribeData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECSubscribeActivity: RECActivity {
    let data: RECSubscribeActivityData
    
    // MARK: Init
    
    public init(
        emailHash: String,
        requestId: String? = nil
    ) {
        self.data = RECSubscribeActivityData(
            emailHash: emailHash,
            requestId: requestId)
        super.init(type: "subscribe")
    }
}

// MARK: - Data

struct RECSubscribeActivityData: Encodable {
    let emailHash: String
    @RECNullEncodable private(set) var requestId: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case emailHash = "email_hash"
        case requestId = "request_id"
    }
}
