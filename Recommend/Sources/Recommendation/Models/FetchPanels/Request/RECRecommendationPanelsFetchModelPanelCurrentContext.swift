//
//  RECRecommendationPanelsFetchModelPanelCurrentContext.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECRecommendationPanelsFetchModelPanelCurrentContext: Encodable {
    let sku: String
    let listId: String
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case sku
        case listId = "list_id"
    }
}
