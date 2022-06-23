//
//  RECActivityCustomerRegistrationData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceCustomerRegistationActivity: RECDeviceActivity {
    let data: RECDeviceCustomerRegistationActivityData
    
    // MARK: Init
    
    public init(
        requestId: String? = nil
    ) {
        self.data = RECDeviceCustomerRegistationActivityData(requestId: requestId)
        super.init(
            type: "customer_registration")
    }
    
    // MARK: Encoding
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try super.encode(to: encoder)
    }
}

// MARK: - Data

struct RECDeviceCustomerRegistationActivityData: Encodable {
    @RECNullEncodable private(set) var requestId: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case requestId = "request_id"
    }
}
