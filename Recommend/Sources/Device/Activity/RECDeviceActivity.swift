//
//  RECDeviceActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public class RECDeviceActivity: Encodable {
    let type: String
    
    // MARK: Init
    
    init(type: String) {
        self.type = type
    }
}
