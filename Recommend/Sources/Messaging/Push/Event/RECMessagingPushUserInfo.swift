//
//  RECMessagingPushUserInfo.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECMessagingPushUserInfo: Decodable {
    let data: RECMessagingPushData
    let isRecommendPushNotification: Bool?
    
    // MARK: Init
    
    init(from userInfo: [AnyHashable: Any]) throws {
        let data = try JSONSerialization.data(withJSONObject: userInfo, options: [])
        self = try JSONDecoder().decode(Self.self, from: data)
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case data
        case isRecommendPushNotification = "recommend_push_notification"
    }
}
