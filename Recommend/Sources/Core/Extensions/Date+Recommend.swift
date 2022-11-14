//
//  Date+Recommend.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 14.03.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

extension Date {
    var secondsSince1970: Int {
        return Int(self.timeIntervalSince1970)
    }
}
