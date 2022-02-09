//
//  RECCartUpdateActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECCartUpdateActivity: RECActivity {
    public typealias ActivityData = RECCartUpdateActivityData
    
    public let data: ActivityData
    
    // MARK: Init
    
    public init(
        cartHash: String,
        requestId: String? = nil
    ) {
        self.data = ActivityData(cartHash: cartHash,
                                 requestId: requestId)
        super.init(type: .cartUpdate)
    }
}

// MARK: - Data

public struct RECCartUpdateActivityData: Encodable {
    public let cartHash: String
    @RECNullEncodable public private(set) var requestId: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case cartHash = "cart_hash"
        case requestId = "request_id"
    }
}
