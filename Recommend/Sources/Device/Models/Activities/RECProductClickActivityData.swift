//
//  RECProductClickActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECProductClickActivity: RECActivity {
    public typealias ActivityData = RECProductClickActivityData
    public typealias Source = RECProductClickActivitySource
    
    public let data: ActivityData
    
    // MARK: Init
    
    public init(
        sku: String,
        products: [RECActivityProduct]?,
        source: Source?
    ) {
        self.data = ActivityData(sku: sku,
                                 products: products,
                                 source: source)
        super.init(type: .productClick)
    }
}

// MARK: - Data

public struct RECProductClickActivityData: Encodable {
    public let sku: String
    public let products: [RECActivityProduct]?
    public let source: RECProductClickActivitySource?
}
