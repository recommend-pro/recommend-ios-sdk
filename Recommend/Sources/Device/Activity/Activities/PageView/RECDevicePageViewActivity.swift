//
//  RECDevicePageViewActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDevicePageViewActivity: RECDeviceActivityWithData {
    public init(
        url: String,
        pageType: String? = nil,
        referrer: String? = nil,
        title: String? = nil
    ) {
        let data = RECDevicePageViewActivityData(
            url: url,
            pageType: pageType,
            referrer: referrer,
            title: title)
        super.init(
            type: "page_view",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func pageView(
        url: String,
        pageType: String? = nil,
        referrer: String? = nil,
        title: String? = nil
    ) -> RECDeviceActivity {
        RECDevicePageViewActivity(
            url: url,
            pageType: pageType,
            referrer: referrer,
            title: title)
    }
}
