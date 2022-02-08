//
//  RECRecommendationAPIService.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECRecommendationAPIService {
    private typealias APIEndpoints = RECRecommendationAPIEndpoints
    
    private let core: RECCore
    private var config: RECConfig {
        return core.config
    }
    
    // MARK: Init
    
    init(core: RECCore) {
        self.core = core
    }
}

