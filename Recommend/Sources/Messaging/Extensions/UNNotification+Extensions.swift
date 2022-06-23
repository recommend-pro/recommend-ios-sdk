//
//  UNNotification+Extensions.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 23.06.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UserNotifications

public extension UNNotification {
    var isRecommend: Bool {
        isRecommendNotification(self.request.content.userInfo)
    }
}
