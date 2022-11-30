//
//  RECDeviceCustomerRegistrationActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceCustomerRegistrationActivityData: RECDeviceActivityData {
    let requestId: String?
    let versionId: String?
    
    // MARK: Init
    
    init(
        requestId: String?,
        versionId: String?
    ) {
        self.requestId = requestId
        self.versionId = versionId
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case requestId = "request_id"
        case versionId = "version_id"
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(requestId, forKey: .requestId)
        try container.encodeIfPresent(versionId, forKey: .versionId)
        try super.encode(to: encoder)
    }
}
