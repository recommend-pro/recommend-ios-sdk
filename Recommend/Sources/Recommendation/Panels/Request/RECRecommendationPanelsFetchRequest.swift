//
//  RECRecommendationPanelsFetchRequest.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECRecommendationPanelsFetchRequest: Encodable {
    typealias ContentType = RECRecommendationPanelsFetchRequestContentType
    typealias Panel = RECRecommendationPanelRequest
    typealias PreviewPanel = RECRecommendationPreviewPanelRequest
    
    let deviceId: String
    let customerIdHash: String?
    let emailHash: String?
    let store: String
    let currency: String
    let environment: String?
    let priceList: RECPriceList
    let metrics: RECMetrics?
    let pageType: String?
    let contentType: ContentType = .json
    let panels: [Panel]?
    let previewPanel: PreviewPanel?
    
    // MARK: Coding
    
    private enum CodingKeys: String, CodingKey {
        case deviceId = "device_id"
        case customerIdHash = "customer_id_hash"
        case emailHash = "email_hash"
        case store = "store_code"
        case currency = "currency_code"
        case environment = "environment_code"
        case priceList = "price_list"
        case metrics
        case pageType = "page_type"
        case contentType = "content_type"
        case panels
        case previewPanel = "preview_panel"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(deviceId, forKey: .deviceId)
        try container.encodeIfPresent(customerIdHash, forKey: .customerIdHash)
        try container.encodeIfPresent(emailHash, forKey: .emailHash)
        try container.encode(store, forKey: .store)
        try container.encode(currency, forKey: .currency)
        try container.encodeIfPresent(environment, forKey: .environment)
        try container.encode(priceList, forKey: .priceList)
        try container.encodeIfPresent(metrics, forKey: .metrics)
        try container.encodeIfPresent(pageType, forKey: .pageType)
        try container.encode(contentType, forKey: .contentType)
        try container.encodeIfPresent(panels, forKey: .panels)
        try container.encodeIfPresent(previewPanel, forKey: .previewPanel)
    }
}
