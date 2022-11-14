//
//  RECRecommendation.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECRecommendation {
    private let core: RECCore
    private let apiService: RECRecommendationAPIService
    
    private var customerInfo: RECCustomerInfo {
        return core.customerInfo
    }
    
    // MARK: Init
    
    init(core: RECCore) {
        self.core = core
        self.apiService = RECRecommendationAPIService(core: core)
    }
    
    // MARK: Panels
    
    private func fetchPanels(
        request: RECRecommendationPanelsFetchRequest,
        completionHandler: @escaping (Result<[RECRecommendationPanel], Error>) -> Void
    ) {
        apiService.fetchPanels(
            request: request,
            completionHandler: completionHandler)
    }
    
    func fetchPanels(
        panels: [RECRecommendationPanelRequest]? = nil,
        previewPanel: RECRecommendationPreviewPanelRequest? = nil,
        pageType: String? = nil,
        completionHandler: @escaping (Result<[RECRecommendationPanel], Error>) -> Void
    ) {
        do {
            let deviceId = try core.getDeviceId()
            
            guard let store = customerInfo.store else {
                throw RECRecommendationNilStoreError()
            }
            
            guard let currency = customerInfo.currency else {
                throw RECRecommendationNilCurrencyError()
            }
            
            guard let priceList = customerInfo.priceList else {
                throw RECRecommendationNilPriceListError()
            }
            
            let request = RECRecommendationPanelsFetchRequest(
                deviceId: deviceId,
                customerIdHash: customerInfo.idHash,
                emailHash: customerInfo.emailHash,
                store: store,
                currency: currency,
                environment: customerInfo.environment,
                priceList: priceList,
                metrics: customerInfo.metrics,
                pageType: pageType,
                panels: panels,
                previewPanel: previewPanel)
            
            fetchPanels(
                request: request,
                completionHandler: completionHandler)
        } catch {
            completionHandler(.failure(error))
        }
    }
}
