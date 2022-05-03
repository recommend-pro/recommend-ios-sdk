//
//  RECActivityCustomerRegistrationData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECCustomerRegistationActivity: RECActivity {
    let data: RECCustomerRegistationActivityData
    
    // MARK: Init
    
    public init(
        requestId: String? = nil
    ) {
        self.data = RECCustomerRegistationActivityData(requestId: requestId)
        super.init(
            type: "customer_registration")
    }
}

// MARK: - Data

struct RECCustomerRegistationActivityData: Encodable {
    @RECNullEncodable private(set) var requestId: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case requestId = "request_id"
    }
}
