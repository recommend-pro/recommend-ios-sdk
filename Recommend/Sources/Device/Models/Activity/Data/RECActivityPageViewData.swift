//
//  RECActivityPageViewData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECActivityPageViewData: Encodable {
    public let url: String
    public let pageType: String?
    public let referrer: String?
    public let title: String?
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case url
        case pageType = "page_type"
        case referrer
        case title
    }
}
