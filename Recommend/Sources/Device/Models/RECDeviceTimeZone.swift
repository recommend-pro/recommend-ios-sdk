//
//  RECDeviceTimeZone.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECTimeZone: Encodable {
    public let code: String
    /// The difference, in seconds, between a date in the UTC time zone, and the same date in the local time zone
    public let offset: Int
    
    // MARK: Init
    
    public init(code: String, offset: Int) {
        self.code = code
        self.offset = offset
    }
    
    public init?(timeZone: TimeZone) {
        guard let code = timeZone.abbreviation() else {
            return nil
        }
        self.init(code: code,
                  offset: timeZone.secondsFromGMT())
    }
    
    // MARK: Current
    
    public static var current: RECTimeZone? {
        return RECTimeZone(timeZone: .current)
    }
}
