//
//  RECElasticListActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECElasticListActivity: RECActivity {
    public typealias ActivityData = RECElasticListActivityData
    
    public let data: ActivityData
    
    // MARK: Init
    
    public init(
        products: [RECActivityProduct]?,
        elasticListId: String
    ) {
        self.data = ActivityData(products: products,
                                 elasticListId: elasticListId)
        super.init(type: .elasticList)
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