//
//  RECListViewActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECListViewActivity: RECActivity {
    let data: RECListViewActivityData
    
    // MARK: Init
    
    public init(
        products: [RECActivityProduct]?,
        listId: String
    ) {
        self.data = RECListViewActivityData(
            products: products,
            listId: listId)
        super.init(
            type: "list_view")
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

struct RECListViewActivityData: Encodable {
    let products: [RECActivityProduct]?
    let listId: String
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case products
        case listId = "list_id"
    }
}
