//
//  RECMessagingPushEvent.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECMessagingPushEvent: Codable {
    let id: String
    let data: RECMessagingPushEventData
}

// MARK: User Info initialization

extension RECMessagingPushEvent {
    init?(
        userInfo: [AnyHashable: Any],
        clicked: Bool? = nil,
        eventTime: Int? = nil
    ) {
        guard let userInfo = try? RECMessagingPushUserInfo(from: userInfo) else {
            return nil
        }
        
        let isRecommend: Bool? = (userInfo.isRecommendPushNotification ?? userInfo.data.isRecommendPushNotification)
        guard isRecommend ?? false else {
            return nil
        }
        
        let data = RECMessagingPushEventData(
            clicked: clicked,
            openURL: userInfo.data.openURL,
            eventTime: eventTime)
        self.init(
            id: userInfo.data.id,
            data: data)
    }
}
