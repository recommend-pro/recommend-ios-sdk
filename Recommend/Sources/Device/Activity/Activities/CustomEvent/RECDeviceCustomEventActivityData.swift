//
//  RECDeviceCustomEventActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceCustomEventActivityData: RECDeviceActivityData {
    let event: String
    
    // MARK: Init
    
    init(event: String) {
        self.event = event
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case event
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(event, forKey: .event)
        try super.encode(to: encoder)
    }
}
