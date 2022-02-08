//
//  RECMessagingPushNotificationEvent.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECMessagingPushNotificationEvent {
    typealias EventData = RECMessagingPushNotificationEventData
    
    let pushId: String
    let data: EventData
}

extension RECMessagingPushNotificationEvent {
    init?(userInfo: RECMessagingUserInfo, clicked: Bool?, eventDate: Date?) {
        guard let pushId = userInfo.data?.id else {
            return nil
        }
        
        var eventTime: Int?
        if let eventDate = eventDate {
            eventTime = Int(eventDate.timeIntervalSince1970)
        }
    
        self.pushId = pushId
        self.data = RECMessagingPushNotificationEventData(received: true,
                                                          clicked: clicked,
                                                          openURL: userInfo.data?.openURLString,
                                                          eventTime: eventTime)
    }
    
    init?(userInfo: [AnyHashable: Any], clicked: Bool?, eventDate: Date?) {
        guard let userInfo = RECMessagingUserInfo(from: userInfo) else {
            return nil
        }
        self.init(userInfo: userInfo,
                  clicked: clicked,
                  eventDate: eventDate)
    }
}
