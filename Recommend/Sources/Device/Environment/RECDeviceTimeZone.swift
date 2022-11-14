//
//  RECDeviceTimeZone.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECDeviceTimeZone: Encodable {
    let code: String
    let offset: Int
    
    // MARK: Init
    
    init(
        code: String,
        offset: Int
    ) {
        self.code = code
        self.offset = offset
    }
    
    init(timeZone: TimeZone) {
        self.init(
            code: timeZone.identifier,
            offset: timeZone.secondsFromGMT())
    }
}

// MARK: - Current Device Time Zone

extension RECDeviceTimeZone {
    static var current: RECDeviceTimeZone {
        return RECDeviceTimeZone(timeZone: .current)
    }
}
