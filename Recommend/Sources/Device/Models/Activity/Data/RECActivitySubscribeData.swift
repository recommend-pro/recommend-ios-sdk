//
//  RECActivitySuscribeData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECActivitySubscribeData: Encodable {
    public let emailHash: String
    @RECNullEncodable public private(set) var requestId: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case emailHash = "email_hash"
        case requestId = "request_id"
    }
    
    // MARK: Init
    
    init(
        emailHash: String,
        requestId: String? = nil
    ) {
        self.requestId = requestId
        self.emailHash = emailHash
    }
}
