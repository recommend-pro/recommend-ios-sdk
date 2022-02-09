//
//  RECActivityElasticListData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECActivityElasticListData: Encodable {
    public let products: [RECActivityProduct]?
    public let elasticListId: String
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case products
        case elasticListId = "elastic_list_id"
    }
    
    // MARK: Init
    
    public init(
        products: [RECActivityProduct]?,
        elasticListId: String
    ) {
        self.products = products
        self.elasticListId = elasticListId
    }
}
