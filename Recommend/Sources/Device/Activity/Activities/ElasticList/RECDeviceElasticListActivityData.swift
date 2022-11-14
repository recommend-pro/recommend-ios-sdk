//
//  RECDeviceElasticListActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceElasticListActivityData: RECDeviceActivityData {
    let products: [RECDeviceActivityProduct]?
    let elasticListId: String
    
    // MARK: Init
    
    init(
        products: [RECDeviceActivityProduct]?,
        elasticListId: String
    ) {
        self.products = products
        self.elasticListId = elasticListId
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case products
        case elasticListId = "elastic_list_id"
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(products, forKey: .products)
        try container.encode(elasticListId, forKey: .elasticListId)
        try super.encode(to: encoder)
    }
}
