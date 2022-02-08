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
    
    private var environment: RECEnvironment {
        return core.environment
    }
    
    // MARK: Init
    
    init(core: RECCore) {
        self.core = core
        self.apiService = APIService(core: core)
    }
    
    // MARK: Fetch Recommendation Panels
    
    private func fetchPanels(
        with model: PanelsFetchModel,
        completion: @escaping (Result<[Panel], Error>) -> Void
    ) {
        apiService.fetchPanels(model: model, completion: completion)
    }
    
    public func fetchPanels(
        pageType: String? = nil,
        panels: [PanelsFetchModel.Panel]? = nil,
        previewPanel: PanelsFetchModel.PreviewPanel? = nil,
        completion: @escaping (Result<[Panel], Error>) -> Void
    ) {
        do {
            let deviceId = try core.config.deviceId()
            
            guard let store = environment.store else {
                throw RECRecommendationError.nilStore
            }
            
            guard let currency = environment.currency else {
                throw RECRecommendationError.nilCurrency
            }
            
            guard let priceList = environment.priceList else {
                throw RECRecommendationError.nilPriceList
            }
            
            let model = PanelsFetchModel(deviceId: deviceId,
                                         customerIdHash: environment.customerIdHash,
                                         store: store,
                                         currency: currency,
                                         environment: environment.environment,
                                         priceList: priceList,
                                         metrics: environment.metrics,
                                         pageType: pageType,
                                         contentType: .json,
                                         panels: panels,
                                         previewPanel: previewPanel)
            self.fetchPanels(with: model, completion: completion)
        } catch {
            completion(.failure(error))
            return
        }
    }
}
