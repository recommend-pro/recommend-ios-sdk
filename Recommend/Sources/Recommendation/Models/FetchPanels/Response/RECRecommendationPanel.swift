//
//  RECRecommendationPanel.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECRecommendationPanel: Decodable {
    public typealias Details = RECRecommendationPanelDetails
    
    public let panelId: String
    public let slotId: String?
    public let html: String?
    public let data: Details?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case panelId = "panel_id"
        case slotId = "slot_id"
        case html
        case data
    }
}
