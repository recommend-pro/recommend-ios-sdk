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
    typealias FetchPanelsModel = RECRecommendationPanelsFetchModel
    typealias Panel = RECRecommendationPanel
    
    private let core: RECCore
    private var config: RECConfig {
        return core.config
    }
    
    // MARK: Init
    
    init(core: RECCore) {
        self.core = core
    }
    
    // MARK: Fetch Recommendation Panels
    
    func fetchPanels(model: FetchPanelsModel, completion: @escaping (Result<[Panel], Error>) -> Void) {
        do {
            let endpoint = APIEndpoints.fetchRecommendationPanels(accountId: config.appId)
            let data = try JSONEncoder().encode(model)
            let request = RECAPIRequest(endpoint: endpoint,
                                        isQueueRequired: true)
            request.httpBody = data
            
            core.execute(apiRequest: request, completion: completion)
        } catch {
            completion(.failure(error))
        }
    }
}

