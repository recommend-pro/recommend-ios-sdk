//
//  RECDeviceActivityWithData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public class RECDeviceActivityWithData: RECDeviceActivity {
    let data: RECDeviceActivityData
    
    // MARK: Init
    
    init(
        type: String,
        data: RECDeviceActivityData
    ) {
        self.data = data
        super.init(type: type)
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try super.encode(to: encoder)
    }
}
