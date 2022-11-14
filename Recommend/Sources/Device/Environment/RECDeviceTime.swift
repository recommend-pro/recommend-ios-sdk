//
//  RECDeviceTime.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECDeviceTime: Encodable {
    let timezone: RECDeviceTimeZone
    let date: String
    
    // MARK: Init
    
    init(
        timeZone: TimeZone,
        date: Date
    ) {
        self.timezone = RECDeviceTimeZone(timeZone: timeZone)
        
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate,
                                   .withDashSeparatorInDate,
                                   .withFullTime,
                                   .withFractionalSeconds]
        self.date = formatter.string(from: date)
    }
}

// MARK: - Current Device Time

extension RECDeviceTime {
    static var current: RECDeviceTime? {
        return RECDeviceTime(
            timeZone: .current,
            date: Date())
    }
}
