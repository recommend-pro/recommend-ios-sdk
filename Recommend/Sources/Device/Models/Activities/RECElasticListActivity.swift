//
//  RECElasticListActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECElasticListActivity: RECActivity {
    let data: RECElasticListActivityData
    
    // MARK: Init
    
    public init(
        products: [RECActivityProduct]?,
        elasticListId: String
    ) {
        self.data = RECElasticListActivityData(
            products: products,
            elasticListId: elasticListId)
        super.init(
            type: "elastic_list")
    }
    
    // MARK: Encoding
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try super.encode(to: encoder)
    }
}

// MARK: - Data

struct RECElasticListActivityData: Encodable {
    let products: [RECActivityProduct]?
    let elasticListId: String
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case products
        case elasticListId = "elastic_list_id"
    }
}
