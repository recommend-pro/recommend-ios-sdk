//
//  RECRecommendationPanelRequestContext.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECRecommendationPanelRequestContext: Encodable {
    public typealias CurrentContext = RECRecommendationPanelRequestCurrentContext
    
    public let searchTerm: String
    public let current: CurrentContext
    public let skus: [String]
    public let listIds: [String]
    
    // MARK: Init
    
    public init(
        searchTerm: String,
        current: CurrentContext,
        skus: [String],
        listIds: [String]
    ) {
        self.searchTerm = searchTerm
        self.current = current
        self.skus = skus
        self.listIds = listIds
    }
    
    // MARK: Coding
    
    private enum CodingKeys: String, CodingKey {
        case searchTerm = "search_term"
        case current
        case skus
        case listIds = "list_ids"
    }
}
