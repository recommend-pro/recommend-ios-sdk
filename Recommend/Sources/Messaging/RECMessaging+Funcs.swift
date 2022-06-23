//
//  RECMessaging+Funcs.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 24.06.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public func isRecommendNotification(
    _ userInfo: [AnyHashable: Any]
) -> Bool {
    RECMessagingPushEvent(userInfo: userInfo) != nil
}

public func recommendOpenURL(fromNotification userInfo: [AnyHashable: Any]) -> URL? {
    RECMessagingPushEvent(userInfo: userInfo)?.openURL
}
