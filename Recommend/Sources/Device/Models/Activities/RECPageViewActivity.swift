//
//  RECPageViewActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECPageViewActivity: RECActivity {
    let data: RECPageViewActivityData
    
    // MARK: Init
    
    public init(
        url: String,
        pageType: String?,
        referrer: String?,
        title: String?
    ) {
        self.data = RECPageViewActivityData(
            url: url,
            pageType: pageType,
            referrer: referrer,
            title: title)
        super.init(
            type: "page_view")
    }
}

// MARK: - Data

struct RECPageViewActivityData: Encodable {
    let url: String
    let pageType: String?
    let referrer: String?
    let title: String?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case url
        case pageType = "page_type"
        case referrer
        case title
    }
}
