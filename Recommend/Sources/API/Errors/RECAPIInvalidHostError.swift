//
//  RECAPIInvalidHostError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 14.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECAPIInvalidHostError: RECAPIError {
    public var errorCode: Int {
        RECAPIErrorCodes.invalidHost.rawValue
    }
    
    public var errorDescription: String? {
        "Provided API host is empty."
    }
    
    public var failureReason: String? {
        errorDescription
    }
    
    public var recoverySuggestion: String? {
        "Re-check API host and provide non-empty value."
    }
}
