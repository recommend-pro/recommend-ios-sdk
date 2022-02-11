//
//  RECDeviceTime.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECDeviceTime: Encodable {
    public let timezone: RECDeviceTimeZone
    /// Date in `ISO 8601` format. Example: `2021-07-30T11:33:04.862Z`.
    public let date: String
    
    // MARK: Init
    
    public init(
        timeZone: TimeZone,
        date: Date
    ) {
        self.timezone = RECDeviceTimeZone(timeZone: timeZone)
        
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate,
                                   .withDashSeparatorInDate,
                                   .withFullTime,
                                   .withColonSeparatorInTime,
                                   .withFractionalSeconds]
        formatter.timeZone = timeZone
        self.date = formatter.string(from: date)
    }
    
    // MARK: Current
    
    public static var current: RECDeviceTime? {
        return RECDeviceTime(
            timeZone: .current,
            date: Date())
    }
}
