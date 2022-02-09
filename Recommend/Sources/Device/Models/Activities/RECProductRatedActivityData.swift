//
//  RECProductRatedActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECProductRatedActivity: RECActivity {
    public typealias ActivityData = RECProductRatedActivityData
    
    public let data: ActivityData
    
    // MARK: Init
    
    public init(
        sku: String,
        rate: Int,
        variationSKU: String?
    ) {
        self.data = ActivityData(sku: sku,
                                 rate: rate,
                                 variationSKU: variationSKU)
        super.init(type: .productRated)
    }
}

// MARK: - Data

public struct RECProductRatedActivityData: Encodable {
    public let sku: String
    public let rate: Int
    public let variationSKU: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case sku
        case rate
        case variationSKU = "variation_sku"
    }
    
    // MARK: Init
    
    init(
        sku: String,
        rate: Int,
        variationSKU: String?
    ) {
        self.sku = sku
        if rate < 0 {
            self.rate = 0
        } else if rate > 1 {
            self.rate = 1
        } else {
            self.rate = rate
        }
        self.variationSKU = variationSKU
    }
}
