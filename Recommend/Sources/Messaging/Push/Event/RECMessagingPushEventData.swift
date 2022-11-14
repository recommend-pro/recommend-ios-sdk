//
//  RECMessagingPushEventData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECMessagingPushEventData: Codable {
    let received: Bool = true
    let clicked: Bool?
    let openURL: String?
    let eventTime: Int?
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case received
        case clicked
        case openURL = "open_url"
        case eventTime = "event_time"
    }
}
