//
//  RECDeviceCheckoutActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceCheckoutActivityData: RECDeviceActivityData {
    let step: String?
    let option: String?
    
    // MARK: Init
    
    init(
        step: String?,
        option: String?
    ) {
        self.step = step
        self.option = option
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case step
        case option
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(step, forKey: .step)
        try container.encodeIfPresent(option, forKey: .option)
        try super.encode(to: encoder)
    }
}
