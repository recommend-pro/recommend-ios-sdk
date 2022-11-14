//
//  RECAPIErrorCodes.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 11.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

enum RECAPIErrorCodes: Int {
    case invalidHost = 0
    case invalidEndpoint = 1
    case nilUserAgent = 2
    case invalidResponse = 3
    case unexpectedResponse = 4
    case errorResponse = 5
    case requestAttemptsLimitExceeded = 6
}
