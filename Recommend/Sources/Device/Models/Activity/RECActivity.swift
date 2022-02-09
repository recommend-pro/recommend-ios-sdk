//
//  RECActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public class RECActivity: Encodable {
    public let type: RECActivityType
    
    // MARK: Init
    
    init(type: RECActivityType) {
        self.type = type
    }
}
