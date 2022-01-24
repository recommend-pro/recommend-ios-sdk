//
//  RECRecommendationPanelsFetchModel.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECRecommendationPanelsFetchModel: Encodable {
    typealias PriceList = RECRecommendationPriceList
    typealias ContentType = RECRecommendationContentType
    typealias Panel = RECRecommendationPanelsFetchModelPanel
    typealias PreviewPanel = RECRecommendationPanelsFetchModelPreviewPanel
    
    let deviceId: String
    let customerIdHash: String?
    let storeCode: String
    let currencyCode: String
    let environmentCode: String?
    let priceList: PriceList
    let metrics: RECMetrics?
    let pageType: String?
    let contentType: ContentType
    let panels: [Panel]?
    let previewPanel: PreviewPanel?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case deviceId = "device_id"
        case customerIdHash = "customer_id_hash"
        case storeCode = "store_code"
        case currencyCode = "currency_code"
        case environmentCode = "environment_code"
        case priceList = "price_list"
        case metrics
        case pageType = "page_type"
        case contentType = "content_type"
        case panels
        case previewPanel = "preview_panel"
    }
}
