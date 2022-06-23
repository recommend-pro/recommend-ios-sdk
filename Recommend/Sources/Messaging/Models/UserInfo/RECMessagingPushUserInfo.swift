//
//  RECMessagingPushUserInfo.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECMessagingPushUserInfo: Decodable {
    typealias UserInfoData = RECMessagingPushUserInfoData
    
    let recommendPushNotification: Bool?
    let data: UserInfoData?
    
    var isRecommendPushNotification: Bool {
        return (recommendPushNotification ?? data?.recommendPushNotification) ?? false
    }
    
    // MARK: Init
    
    init?(from userInfo: [AnyHashable: Any]) {
        do {
            let data = try JSONSerialization.data(withJSONObject: userInfo, options: [])
            let userInfo = try JSONDecoder().decode(Self.self, from: data)
            
            guard userInfo.isRecommendPushNotification else {
                return nil
            }
            
            self = userInfo
        } catch {
            return nil
        }
    }
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case recommendPushNotification = "recommend_push_notification"
        case data
    }
}
