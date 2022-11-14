//
//  RECDeviceSearchViewActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceSearchViewActivity: RECDeviceActivityWithData {
    public init(
        products: [RECDeviceActivityProduct]? = nil,
        term: RECDeviceActivitySearchTerm
    ) {
        let data = RECDeviceSearchViewActivityData(
            products: products,
            term: term)
        super.init(
            type: "search_view",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func searchView(
        products: [RECDeviceActivityProduct]? = nil,
        term: RECDeviceActivitySearchTerm
    ) -> RECDeviceActivity {
        RECDeviceSearchViewActivity(
            products: products,
            term: term)
    }
}
