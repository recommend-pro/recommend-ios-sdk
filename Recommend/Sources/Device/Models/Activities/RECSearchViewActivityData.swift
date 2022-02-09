//
//  RECSearchViewActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECSearchViewActivity: RECActivity {
    public typealias ActivityData = RECSearchViewActivityData
    
    public let data: ActivityData
    
    // MARK: Init
    
    public init(
        products: [RECActivityProduct]?,
        term: RECActivitySearchTerm
    ) {
        self.data = ActivityData(products: products,
                                 term: term)
        super.init(type: .searchView)
    }
}

// MARK: - Data

public struct RECSearchViewActivityData: Encodable {
    public let products: [RECActivityProduct]?
    public let term: RECActivitySearchTerm
}

