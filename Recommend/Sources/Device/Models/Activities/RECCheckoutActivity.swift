//
//  RECCheckoutActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECCheckoutActivity: RECActivity {
    let data: RECCheckoutActivityData
    
    // MARK: Init
    
    public init(
        step: String?,
        option: String?
    ) {
        self.data = RECCheckoutActivityData(
            step: step,
            option: option)
        super.init(
            type: "checkout")
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

struct RECCheckoutActivityData: Encodable {
    let step: String?
    let option: String?
}
