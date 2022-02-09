//
//  RECActivitySuscribeData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECSubscribeActivity: RECDataActivity<RECSubscribeActivityData> {
    public init(
        emailHash: String,
        requestId: String? = nil
    ) {
        let data = RECSubscribeActivityData(
            emailHash: emailHash,
            requestId: requestId)
        super.init(
            type: .subscribe,
            data: data)
    }
}

// MARK: - Data

public struct RECSubscribeActivityData: Encodable {
    public let emailHash: String
    @RECNullEncodable public private(set) var requestId: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case emailHash = "email_hash"
        case requestId = "request_id"
    }
}
