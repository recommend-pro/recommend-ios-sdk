//
//  RECRecommendation.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECRecommendation {
    private typealias APIService = RECRecommendationAPIService
    
    private let core: RECCore
    private let apiService: APIService
    
    private var environment: RECEnvironment {
        return core.environment
    }
    
    // MARK: Init
    
    init(core: RECCore) {
        self.core = core
        self.apiService = APIService(core: core)
    }
}
