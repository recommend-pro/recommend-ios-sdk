//
//  RECActivityCartUpdateData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECActivityCartUpdateData: Encodable {
    public let cartHash: String
    @RECNullEncodable public private(set) var requestId: String?
    
    enum CodingKeys: String, CodingKey {
        case cartHash = "cart_hash"
        case requestId = "request_id"
    }
}
