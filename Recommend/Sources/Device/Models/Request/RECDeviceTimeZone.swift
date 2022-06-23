//
//  RECDeviceTimeZone.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECDeviceTimeZone: Encodable {
    /// Time zone identifier
    public let code: String
    /// The difference, in seconds, between a date in the UTC time zone, and the same date in the local time zone
    public let offset: Int
    
    // MARK: Init
    
    public init(
        code: String,
        offset: Int
    ) {
        self.code = code
        self.offset = offset
    }
    
    public init(timeZone: TimeZone) {
        self.init(code: timeZone.identifier,
                  offset: timeZone.secondsFromGMT())
    }
}

// MARK: - Current Device Time Zone

extension RECDeviceTimeZone {
    /// The time zone currently used by the system.
    public static var current: RECDeviceTimeZone {
        return RECDeviceTimeZone(timeZone: .current)
    }
}
