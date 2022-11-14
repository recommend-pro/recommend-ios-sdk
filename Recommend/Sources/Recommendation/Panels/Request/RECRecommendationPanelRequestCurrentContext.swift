//
//  RECRecommendationPanelRequestCurrentContext.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECRecommendationPanelRequestCurrentContext: Encodable {
    public let sku: String
    public let listId: String
    
    // MARK: Init
    
    public init(
        sku: String,
        listId: String
    ) {
        self.sku = sku
        self.listId = listId
    }
    
    // MARK: Coding
    
    private enum CodingKeys: String, CodingKey {
        case sku
        case listId = "list_id"
    }
}
