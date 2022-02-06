//
//  RECRecommendationPanelsFetchModelPanel.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECRecommendationPanelsFetchModelPanel: Encodable {
    public typealias Context = RECRecommendationPanelsFetchModelPanelContext
    public typealias Filter = RECRecommendationPanelsFetchModelPanelFilter
    public typealias Variations = RECRecommendationPanelsFetchModelPanelVariations
    
    public let id: String
    public let context: Context?
    public let filters: [Filter]?
    public let attrsToInclude: [String]?
    public let variations: Variations?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case id
        case context
        case filters = "filter"
        case attrsToInclude = "attrs_to_include"
        case variations
    }
}
