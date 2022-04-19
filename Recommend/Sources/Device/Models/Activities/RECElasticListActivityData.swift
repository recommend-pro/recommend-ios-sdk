//
//  RECElasticListActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECElasticListActivity: RECDataActivity<RECElasticListActivityData> {
    public init(
        products: [RECActivityProduct]?,
        elasticListId: String
    ) {
        let data = RECElasticListActivityData(
            products: products,
            elasticListId: elasticListId)
        super.init(
            type: .elasticList,
            data: data)
    }
}

// MARK: - Data

public struct RECElasticListActivityData: Encodable {
    public let products: [RECActivityProduct]?
    public let elasticListId: String
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case products
        case elasticListId = "elastic_list_id"
    }
}
