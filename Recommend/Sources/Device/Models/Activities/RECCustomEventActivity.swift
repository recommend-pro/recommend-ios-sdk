//
//  RECCustomEventActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECCustomEventActivity: RECActivity {
    let data: RECCustomEventActivityData
    
    // MARK: Init
    
    public init(
        event: String
    ) {
        self.data = RECCustomEventActivityData(event: event)
        super.init(
            type: "custom_event")
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

struct RECCustomEventActivityData: Encodable {
    let event: String
}
