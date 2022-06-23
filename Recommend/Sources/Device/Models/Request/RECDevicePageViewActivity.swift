//
//  RECDevicePageViewActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDevicePageViewActivity: RECDeviceActivity {
    let data: RECDevicePageViewActivityData
    
    // MARK: Init
    
    public init(
        url: String,
        pageType: String?,
        referrer: String?,
        title: String?
    ) {
        self.data = RECDevicePageViewActivityData(
            url: url,
            pageType: pageType,
            referrer: referrer,
            title: title)
        super.init(
            type: "page_view")
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

struct RECDevicePageViewActivityData: Encodable {
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
