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
    private var apiClient: RECAPIClient {
        return core.apiClient
    }
    private var config: RECConfig {
        return core.config
    }
    
    // MARK: Init
    
    init(core: RECCore) {
        self.core = core
    }
    
    // MARK: Fetch Recommendation Panels
    
    func fetchPanels(
        model: RECRecommendationPanelsRequest,
        completion: @escaping (Result<[RECRecommendationPanel], Error>) -> Void
    ) {
        do {
            let endpoint = APIEndpoints.fetchRecommendationPanels(accountId: config.accountId)
            let data = try JSONEncoder().encode(model)
            
            apiClient.executeRequest(
                with: endpoint,
                httpBody: data,
                attemptsLimit: 1,
                completion: completion)
        } catch {
            completion(.failure(error))
        }
    }
}

