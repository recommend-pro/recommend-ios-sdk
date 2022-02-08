//
//  RECRecommendationPanelsFetchPreviewPanel.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECRecommendationPanelsFetchPreviewPanel: Encodable {
    public let global: Bool
    public let ids: [String]
    
    // MARK: Init
    
    public init(
        global: Bool,
        ids: [String]
    ) {
        self.global = global
        self.ids = ids
    }
}
