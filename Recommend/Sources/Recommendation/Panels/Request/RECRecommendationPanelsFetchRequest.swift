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
}
