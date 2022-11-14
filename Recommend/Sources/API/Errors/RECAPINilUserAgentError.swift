//
//  RECAPINilUserAgentError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 11.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECAPINilUserAgentError: RECAPIError {
    public var errorCode: Int {
        RECAPIErrorCodes.nilUserAgent.rawValue
    }
    
    public var errorDescription: String? {
        "User-Agent is not provided for API request."
    }
}
