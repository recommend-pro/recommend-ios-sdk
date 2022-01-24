//
//  RECRecommendationPriceList.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECRecommendationPriceList: Encodable {
    let code: String
    let fallbackMode: FallbackMode?
    let alternatives: [String]?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case code
        case fallbackMode = "fallback_mode"
        case alternatives
    }
    
    // MARK: Fallback Mode
    
    enum FallbackMode: String, Encodable {
        case none
        case `default`
        case alternative
    }
}
