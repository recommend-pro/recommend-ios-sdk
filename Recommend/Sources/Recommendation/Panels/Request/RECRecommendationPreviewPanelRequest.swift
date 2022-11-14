//
//  RECRecommendationPreviewPanelRequest.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECRecommendationPreviewPanelRequest: Encodable {
    public let global: Bool?
    public let ids: [String]?
    
    // MARK: Init
    
    public init(
        global: Bool?,
        ids: [String]?
    ) {
        self.global = global
        self.ids = ids
    }
    
    // MARK: Coding
    
    private enum CodingKeys: String, CodingKey {
        case global
        case ids
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(global, forKey: .global)
        try container.encodeIfPresent(ids, forKey: .ids)
    }
}
