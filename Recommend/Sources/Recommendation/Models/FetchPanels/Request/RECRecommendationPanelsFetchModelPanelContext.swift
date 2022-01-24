//
//  RECRecommendationPanelsFetchModelPanelContext.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECRecommendationPanelsFetchModelPanelContext: Encodable {
    typealias CurrentContext = RECRecommendationPanelsFetchModelPanelCurrentContext
    
    let searchTerm: String
    let current: CurrentContext
    let skus: [String]
    let listIds: [String]
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case searchTerm = "search_term"
        case current
        case skus
        case listIds = "list_ids"
    }
}
