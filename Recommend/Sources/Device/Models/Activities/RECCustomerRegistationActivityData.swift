//
//  RECActivityCustomerRegistrationData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECCustomerRegistationActivity: RECActivity {
    public typealias ActivityData = RECCustomerRegistationActivityData
    
    public let data: ActivityData
    
    // MARK: Init
    
    public init(
        requestId: String? = nil
    ) {
        self.data = ActivityData(requestId: requestId)
        super.init(type: .customerRegistration)
    }
}

// MARK: - Data

public struct RECCustomerRegistationActivityData: Encodable {
    @RECNullEncodable public private(set) var requestId: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case requestId = "request_id"
    }
}
