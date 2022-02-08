//
//  RECActivityCustomerRegistrationData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECActivityCustomerRegistationData: Encodable {
    @RECNullEncodable public private(set) var requestId: String?
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case requestId = "request_id"
    }
}
