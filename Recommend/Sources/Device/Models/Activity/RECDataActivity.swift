//
//  RECActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public class RECDataActivity<T>: RECActivity where T : Encodable {
    let data: T
    
    // MARK: Init
    
    init(
        type: RECActivityType,
        data: T
    ) {
        self.data = data
        super.init(type: type)
    }
    
    // MARK: Encode
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try super.encode(to: encoder)
    }
}
