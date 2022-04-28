//
//  RECActivityCustomerRegistrationData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECCustomerRegistationActivity: RECDataActivity<RECCustomerRegistationActivityData> {
    public init(
        requestId: String? = nil
    ) {
        let data = RECCustomerRegistationActivityData(requestId: requestId)
        super.init(
            type: .customerRegistration,
            data: data)
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
