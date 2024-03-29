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
    
    // MARK: Init
    
    public init(
        include: Bool,
        attrsToInclude: [String]?
    ) {
        self.include = include
        self.attrsToInclude = attrsToInclude
    }
    
    // MARK: Coding
    
    private enum CodingKeys: String, CodingKey {
        case include
        case attrsToInclude = "attrs_to_include"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(include, forKey: .include)
        try container.encodeIfPresent(attrsToInclude, forKey: .attrsToInclude)
    }
}
