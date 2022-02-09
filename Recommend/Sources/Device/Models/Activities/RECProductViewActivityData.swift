//
//  RECProductViewActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECProductViewActivity: RECActivity {
    public typealias ActivityData = RECProductViewActivityData
    
    public let data: ActivityData
    
    // MARK: Init
    
    public init(
        sku: String,
        variationSKU: String?
    ) {
        self.data = ActivityData(sku: sku,
                                 variationSKU: variationSKU)
        super.init(type: .productView)
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
