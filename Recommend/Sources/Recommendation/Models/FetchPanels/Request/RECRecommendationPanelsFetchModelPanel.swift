//
//  RECRecommendationPanelsFetchModelPanel.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECRecommendationPanelsFetchModelPanel: Encodable {
    typealias Context = RECRecommendationPanelsFetchModelPanelContext
    typealias Filter = RECRecommendationPanelsFetchModelPanelFilter
    typealias AttributesKeys = RECRecommendationPanelsFetchModelPanelAttributesKeys
    typealias Variations = RECRecommendationPanelsFetchModelPanelVariations
    
    let id: String
    let context: Context?
    let filters: [Filter]?
    let attrsToInclude: [AttributesKeys]?
    let variations: Variations?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case id
        case context
        case filters = "filter"
        case attrsToInclude = "attrs_to_include"
        case variations
    }
}
