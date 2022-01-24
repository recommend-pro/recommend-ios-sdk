//
//  RECRecommendationPanelsFetchModelPanelVariations.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 24.01.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECRecommendationPanelsFetchModelPanelVariations: Encodable {
    typealias AttributesKeys = RECRecommendationPanelsFetchModelPanelAttributesKeys
    
    let include: Bool
    let attrsToInclude: [AttributesKeys]?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case include
        case attrsToInclude = "attrs_to_include"
    }  
}
