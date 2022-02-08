//
//  RECDeviceTime.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECDeviceTime: Encodable {
    public let timezone: RECTimeZone
    /// Date in `ISO 8601` format. Example: `2021-07-30T11:33:04.862Z`.
    public let date: String
    
    // MARK: Init
    
    init(timezone: RECTimeZone, date: Date) {
        self.timezone = timezone
        
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate,
                                   .withDashSeparatorInDate,
                                   .withFullTime,
                                   .withColonSeparatorInTime,
                                   .withFractionalSeconds]
        self.date = formatter.string(from: date)
    }
    
    // MARK: Current
    
    public static var current: RECDeviceTime? {
        guard let timezone = RECTimeZone.current else {
            return nil
        }
        let date = Date()
        return RECDeviceTime(timezone: timezone, date: date)
    }
}
