//
//  RECInvalidUserDefaultsError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 13.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECInvalidUserDefaultsError: RECCoreError {
    public var errorCode: Int {
        RECCoreErrorCodes.invalidUserDefaults.rawValue
    }
    
    public var errorDescription: String? {
        "UserDefaults is not loaded with specific suiteName."
    }
}
