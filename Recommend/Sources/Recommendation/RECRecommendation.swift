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
    public typealias PanelsFetchModel = RECRecommendationPanelsFetchModel
    public typealias Panel = RECRecommendationPanel
    
    private let core: RECCore
    private let apiService: APIService
    
    // MARK: Init
    
    init(core: RECCore) {
        self.core = core
        self.apiService = APIService(core: core)
    }
    
    // MARK: Fetch Panels
    
    public func fetchPanels(with model: PanelsFetchModel, completion: @escaping (Result<[Panel], Error>) -> Void) {
        apiService.fetchPanels(model: model, completion: completion)
    }
}
