//
//  RECDeviceElasticListActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceElasticListActivity: RECDeviceActivityWithData {
    public init(
        products: [RECDeviceActivityProduct]? = nil,
        elasticListId: String
    ) {
        let data = RECDeviceElasticListActivityData(
            products: products,
            elasticListId: elasticListId)
        super.init(
            type: "elastic_list",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func elasticList(
        products: [RECDeviceActivityProduct]? = nil,
        elasticListId: String
    ) -> RECDeviceActivity {
        RECDeviceElasticListActivity(
            products: products,
            elasticListId: elasticListId)
    }
}
