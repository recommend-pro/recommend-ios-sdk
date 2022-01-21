//
//  RECCore.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECCore: NSObject {
    let config: RECConfig
    
    // MARK: Init
    
    init(config: RECConfig) {
        self.config = config
    }
}
