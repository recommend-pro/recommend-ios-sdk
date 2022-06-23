//
//  RECRecommendationPanelRequest.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECRecommendationPanelRequest: Encodable {
    public typealias Context = RECRecommendationPanelRequestContext
    public typealias Filter = RECRecommendationPanelRequestFilter
    public typealias Variations = RECRecommendationPanelRequestVariations
    
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
    
    // MARK: Init
    
    public init(
        id: String,
        context: Context?,
        filters: [Filter]?,
        attrsToInclude: [String]?,
        variations: Variations?
    ) {
        self.id = id
        self.context = context
        self.filters = filters
        self.attrsToInclude = attrsToInclude
        self.variations = variations
    }
}
