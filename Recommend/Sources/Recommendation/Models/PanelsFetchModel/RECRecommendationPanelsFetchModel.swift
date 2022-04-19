//
//  RECRecommendationPanelsFetchModel.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECRecommendationPanelsFetchModel: Encodable {
    public typealias ContentType = RECRecommendationPanelsFetchContentType
    public typealias Panel = RECRecommendationPanelRequest
    public typealias PreviewPanel = RECRecommendationPanelsFetchPreviewPanel
    
    public let deviceId: String
    public let customerIdHash: String?
    public let store: String
    public let currency: String
    public let environment: String?
    public let priceList: RECPriceList
    public let metrics: RECMetrics?
    public let pageType: String?
    public let contentType: ContentType
    public let panels: [Panel]?
    public let previewPanel: PreviewPanel?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case deviceId = "device_id"
        case customerIdHash = "customer_id_hash"
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
