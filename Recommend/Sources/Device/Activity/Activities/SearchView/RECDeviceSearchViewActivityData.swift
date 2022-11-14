//
//  RECDeviceSearchViewActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceSearchViewActivityData: RECDeviceActivityData {
    let products: [RECDeviceActivityProduct]?
    let term: RECDeviceActivitySearchTerm
    
    // MARK: Init
    
    init(
        products: [RECDeviceActivityProduct]?,
        term: RECDeviceActivitySearchTerm
    ) {
        self.products = products
        self.term = term
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case products
        case term
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(products, forKey: .products)
        try container.encode(term, forKey: .term)
        try super.encode(to: encoder)
    }
}
