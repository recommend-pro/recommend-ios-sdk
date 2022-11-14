//
//  RECInvalidAccountIdError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 13.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECInvalidAccountIdError: RECCoreError {
    public var errorCode: Int {
        RECCoreErrorCodes.invalidAccountId.rawValue
    }
    
    public var errorDescription: String? {
        "Provided for initialization Account Id is empty."
    }
    
    public var failureReason: String? {
        "Provided for initialization Account Id is empty."
    }
    
    public var recoverySuggestion: String? {
        "Re-check Account Id value and provide non-empty value."
    }
}
