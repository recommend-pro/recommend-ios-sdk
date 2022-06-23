//
//  RECDeviceSearchViewActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceSearchViewActivity: RECDeviceActivity {
    let data: RECDeviceSearchViewActivityData
    
    // MARK: Init
    
    public init(
        products: [RECDeviceActivityProduct]?,
        term: RECDeviceActivitySearchTerm
    ) {
        self.data = RECDeviceSearchViewActivityData(
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

struct RECDeviceSearchViewActivityData: Encodable {
    let products: [RECDeviceActivityProduct]?
    let term: RECDeviceActivitySearchTerm
}

