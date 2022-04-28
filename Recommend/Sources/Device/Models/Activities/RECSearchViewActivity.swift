//
//  RECSearchViewActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECSearchViewActivity: RECDataActivity<RECSearchViewActivityData> {
    public init(
        products: [RECActivityProduct]?,
        term: RECActivitySearchTerm
    ) {
        let data = RECSearchViewActivityData(
            products: products,
            term: term)
        super.init(
            type: "search_view",
            data: data)
    }
}

// MARK: - Data

public struct RECSearchViewActivityData: Encodable {
    public let products: [RECActivityProduct]?
    public let term: RECActivitySearchTerm
}

