//
//  RECListViewActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECListViewActivity: RECDataActivity<RECListViewActivityData> {
    public init(
        products: [RECActivityProduct]?,
        listId: String
    ) {
        let data = RECListViewActivityData(
            products: products,
            listId: listId)
        super.init(
            type: .listView,
            data: data)
    }
}

// MARK: - Data

public struct RECListViewActivityData: Encodable {
    public let products: [RECActivityProduct]?
    public let listId: String
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case products
        case listId = "list_id"
    }
}
