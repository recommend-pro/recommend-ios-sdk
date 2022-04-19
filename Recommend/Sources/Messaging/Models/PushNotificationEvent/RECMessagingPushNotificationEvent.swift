//
//  RECMessagingPushNotificationEvent.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UserNotifications

struct RECMessagingPushNotificationEvent {
    typealias EventData = RECMessagingPushNotificationEventData
    
    let pushId: String
    let data: EventData
    
    // MARK: Init
    
    init(
        pushId: String,
        data: EventData
    ) {
        self.pushId = pushId
        self.data = data
    }
}

// MARK: - Extended init

extension RECMessagingPushNotificationEvent {
    init?(
        userInfo: RECMessagingUserInfo,
        clicked: Bool? = nil,
        eventDate: Date? = nil
    ) {
        guard let pushId = userInfo.data?.id else {
            return nil
        }
        
        self.pushId = pushId
        self.data = RECMessagingPushNotificationEventData(received: true,
                                                          clicked: clicked,
                                                          openURL: userInfo.data?.openURLString,
                                                          eventTime: eventDate?.secondsSince1970)
    }
    
    init?(
        userInfo: [AnyHashable: Any],
        clicked: Bool? = nil,
        eventDate: Date?
    ) {
        guard let userInfo = RECMessagingUserInfo(from: userInfo) else {
            return nil
        }
        self.init(userInfo: userInfo,
                  clicked: clicked,
                  eventDate: eventDate)
    }
    
    init?(
        notification: UNNotification,
        clicked: Bool? = nil
    ) {
        self.init(userInfo: notification.request.content.userInfo,
                  clicked: clicked,
                  eventDate: notification.date)
    }
}
