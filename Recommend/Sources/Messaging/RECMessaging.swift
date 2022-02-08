//
//  RECMessaging.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UserNotifications

public final class RECMessaging: NSObject {
    private let core: RECCore
    private let userNotificationCenter: UNUserNotificationCenter
    
    private var applicationName: String {
        return core.config.appName
    }
    
    // MARK: Init
    
    init(core: RECCore, userNotificationCenter: UNUserNotificationCenter = .current()) {
        self.core = core
        self.userNotificationCenter = userNotificationCenter
    }
}
