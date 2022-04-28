//
//  RECProductViewActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECProductViewActivity: RECDataActivity<RECProductViewActivityData> {
    public init(
        sku: String,
        variationSKU: String?
    ) {
        let data = RECProductViewActivityData(
            sku: sku,
            variationSKU: variationSKU)
        super.init(
            type: .productView,
            data: data)
    }
}

// MARK: - Data

public struct RECProductViewActivityData: Encodable {
    public let sku: String
    public let variationSKU: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case sku
        case variationSKU = "variation_sku"
    }
}
