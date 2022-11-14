//
//  RECListViewActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceListViewActivityData: RECDeviceActivityData {
    let products: [RECDeviceActivityProduct]?
    let listId: String
    
    // MARK: Init
    
    init(
        products: [RECDeviceActivityProduct]?,
        listId: String
    ) {
        self.products = products
        self.listId = listId
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case products
        case listId = "list_id"
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(products, forKey: .products)
        try container.encode(listId, forKey: .listId)
        try super.encode(to: encoder)
    }
}
