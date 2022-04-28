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
}

// MARK: - Data

struct RECSearchViewActivityData: Encodable {
    let products: [RECActivityProduct]?
    let term: RECActivitySearchTerm
}

