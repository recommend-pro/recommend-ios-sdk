//
//  RECRecommendation.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECRecommendation {
    private let core: RECCore
    
    private var environment: RECEnvironment {
        return core.environment
    }
    
    // MARK: Init
    
    init(core: RECCore) {
        self.core = core
    }
}
