//
//  RECDeviceListViewActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceListViewActivity: RECDeviceActivityWithData {
    public init(
        products: [RECDeviceActivityProduct]? = nil,
        listId: String
    ) {
        let data = RECDeviceListViewActivityData(
            products: products,
            listId: listId)
        super.init(
            type: "list_view",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func listView(
        products: [RECDeviceActivityProduct]? = nil,
        listId: String
    ) -> RECDeviceActivity {
        RECDeviceListViewActivity(
            products: products,
            listId: listId)
    }
}
