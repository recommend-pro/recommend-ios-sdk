//
//  RECRecommendationPanelDetails.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECRecommendationPanelDetails: Decodable {
    let locale: String
    let panelId: String?
    let products: [RECRecommendationProduct]
    let requestCountry: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case locale
        case panelId = "panel_id"
        case products
        case requestCountry = "request_country"
    }
}
