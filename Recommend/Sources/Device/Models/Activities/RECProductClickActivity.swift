//
//  RECProductClickActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECProductClickActivity: RECDataActivity<RECProductClickActivityData> {
    public typealias Source = RECProductClickActivitySource

    // MARK: Init

    public init(
        sku: String,
        products: [RECActivityProduct]?,
        source: Source?
    ) {
        let data = RECProductClickActivityData(
            sku: sku,
            products: products,
            source: source)
        super.init(
            type: "product_click",
            data: data)
    }
}

// MARK: - Data

public struct RECProductClickActivityData: Encodable {
    public let sku: String
    public let products: [RECActivityProduct]?
    public let source: RECProductClickActivitySource?
}
