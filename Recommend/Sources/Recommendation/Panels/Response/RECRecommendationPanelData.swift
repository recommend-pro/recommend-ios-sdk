//
//  RECRecommendationPanelData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECRecommendationPanelData: Decodable {
    public let locale: String
    public let panelId: String?
    public let products: [RECRecommendationPanelProduct]
    public let requestCountry: String?
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case locale
        case panelId = "panel_id"
        case products
        case requestCountry = "request_country"
    }
}
