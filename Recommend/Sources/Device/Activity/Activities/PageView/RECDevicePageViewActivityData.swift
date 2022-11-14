//
//  RECDevicePageViewActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDevicePageViewActivityData: RECDeviceActivityData {
    let url: String
    let pageType: String?
    let referrer: String?
    let title: String?
    
    // MARK: Init
    
    init(
        url: String,
        pageType: String?,
        referrer: String?,
        title: String?
    ) {
        self.url = url
        self.pageType = pageType
        self.referrer = referrer
        self.title = title
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case url
        case pageType = "page_type"
        case referrer
        case title
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(url, forKey: .url)
        try container.encodeIfPresent(pageType, forKey: .pageType)
        try container.encodeIfPresent(referrer, forKey: .referrer)
        try container.encodeIfPresent(title, forKey: .title)
        try super.encode(to: encoder)
    }
}
