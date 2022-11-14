//
//  RECRecommendationAPIService.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECRecommendationAPIService {
    private let core: RECCore
    private var apiClient: RECAPIClient {
        return core.apiClient
    }
    
    private var fetchPanelsEndpoint: RECAPIEndpoint {
        RECAPIEndpoint(
            method: .post,
            path: "/v3/\(core.accountId)/recommendation/panel",
            headers: [
                "Accept": "application/json",
                "Content-Type": "application/json"
            ])
    }
    
    // MARK: Init
    
    init(core: RECCore) {
        self.core = core
    }
    
    // MARK: Fetch Panels
    
    func fetchPanels(
        request: RECRecommendationPanelsFetchRequest,
        completionHandler: @escaping (Result<[RECRecommendationPanel], Error>) -> Void
    ) {
        do {
            let body = try JSONEncoder().encode(request)
            apiClient.processRequest(
                for: fetchPanelsEndpoint,
                with: body,
                completionHandler: completionHandler)
        } catch {
            completionHandler(.failure(error))
        }
    }
}
