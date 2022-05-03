//
//  RECActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

typealias RECActivityType = String

public class RECActivity: Encodable {
    let type: RECActivityType
    
    // MARK: Init
    
    init(type: RECActivityType) {
        self.type = type
    }
}
