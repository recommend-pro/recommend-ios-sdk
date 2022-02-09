//
//  RECPageViewActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECPageViewActivity: RECActivity {
    public typealias ActivityData = RECPageViewActivityData
    
    public let data: ActivityData
    
    // MARK: Init
    
    public init(
        url: String,
        pageType: String?,
        referrer: String?,
        title: String?
    ) {
        self.data = ActivityData(url: url,
                                 pageType: pageType,
                                 referrer: referrer,
                                 title: title)
        super.init(type: .pageView)
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