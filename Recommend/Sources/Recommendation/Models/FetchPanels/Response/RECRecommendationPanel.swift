//
//  RECRecommendationPanel.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECRecommendationPanel: Decodable {
    typealias Details = RECRecommendationPanelDetails
    
    let panelId: String
    let slotId: String?
    let html: String?
    let data: Details?
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case panelId = "panel_id"
        case slotId = "slot_id"
        case html
        case data
    }
}
