//
//  RECMessagingPushToken.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECMessagingPushToken: Encodable {
    let value: String
    
    // MARK: Init
    
    init(deviceToken: Data) {
        self.value = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
    }
}
