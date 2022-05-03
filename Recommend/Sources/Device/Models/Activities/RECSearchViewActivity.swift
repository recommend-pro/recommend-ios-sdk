//
//  RECSearchViewActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECSearchViewActivity: RECActivity {
    let data: RECSearchViewActivityData
    
    // MARK: Init
    
    public init(
        products: [RECActivityProduct]?,
        term: RECActivitySearchTerm
    ) {
        self.data = RECSearchViewActivityData(
            products: products,
            term: term)
        super.init(type: "search_view")
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

struct RECSearchViewActivityData: Encodable {
    let products: [RECActivityProduct]?
    let term: RECActivitySearchTerm
}

