//
//  RECMessagingPushEvent.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECMessagingPushEvent {
    let id: String
    let openURLString: String?
    let clicked: Bool?
    let date: Date?
    
    var openURL: URL? {
        guard let openURLString = openURLString else {
            return nil
        }
        return URL(string: openURLString)
    }
    
    var dateInSeconds: Int? {
        guard let timeInterval = date?.timeIntervalSince1970 else {
            return nil
        }
        return Int(timeInterval)
    }
    
    init?(
        userInfo: [AnyHashable: Any],
        clicked: Bool? = nil,
        date: Date? = nil
    ) {
        var isRecommend: Bool = userInfo.recommendPushNotification ?? false
        
        guard let data = userInfo.data else {
            return nil
        }
        
        if isRecommend == false {
            isRecommend = data.recommendPushNotification ?? false
        }
        
        guard isRecommend else {
            return nil
        }
        
        guard let id = data.id else {
            return nil
        }
        
        self.id = id
        self.openURLString = data.openURL
        self.clicked = clicked
        self.date = date
    }
}

private extension Dictionary where Key == AnyHashable, Value == Any {
    var recommendPushNotification: Bool? {
        self["recommend_push_notification"] as? Bool
    }
    
    var data: [AnyHashable: Any]? {
        self["data"] as? [AnyHashable: Any]
    }
    
    var id: String? {
        self["_rec_mid"] as? String
    }
    
    var openURL: String? {
        self["open-url"] as? String
    }
}
