//
//  RECMessagingPushUserInfoData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECMessagingPushData: Decodable {
    let id: String
    let openURL: String?
    let isRecommendPushNotification: Bool?
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case id = "_rec_mid"
        case openURL = "open-url"
        case isRecommendPushNotification = "recommend_push_notification"
    }
}
