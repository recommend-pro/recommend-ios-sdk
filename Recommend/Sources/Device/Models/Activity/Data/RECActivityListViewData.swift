//
//  RECActivityListViewData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECActivityListViewData: Encodable {
    public let products: [RECActivityProduct]?
    public let listId: String
    
    enum CodingKeys: String, CodingKey {
        case products
        case listId = "list_id"
    }
}
