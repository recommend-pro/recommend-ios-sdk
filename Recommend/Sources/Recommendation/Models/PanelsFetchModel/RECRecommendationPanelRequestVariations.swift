//
//  RECRecommendationPanelRequestVariations.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 24.01.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECRecommendationPanelRequestVariations: Encodable {
    public let include: Bool
    public let attrsToInclude: [String]?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case include
        case attrsToInclude = "attrs_to_include"
    }  
}
