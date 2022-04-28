//
//  RECPageViewActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECPageViewActivity: RECDataActivity<RECPageViewActivityData> {
    public init(
        url: String,
        pageType: String?,
        referrer: String?,
        title: String?
    ) {
        let data = RECPageViewActivityData(
            url: url,
            pageType: pageType,
            referrer: referrer,
            title: title)
        super.init(
            type: "page_view",
            data: data)
    }
}

// MARK: - Data

public struct RECPageViewActivityData: Encodable {
    public let url: String
    public let pageType: String?
    public let referrer: String?
    public let title: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case url
        case pageType = "page_type"
        case referrer
        case title
    }
}
