//
//  RECInvalidInfoPlistError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 14.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECInvalidInfoPlistError: RECCoreError {
    let error: Error?
    
    public var errorCode: Int {
        RECCoreErrorCodes.invalidPlist.rawValue
    }
    
    public var errorDescription: String? {
        if let error = self.error {
            return "Provided \(kRECInfoPlistName) is invalid. Loading ended with error: \(error)"
        } else {
            return "\(kRECInfoPlistName) is not exist."
        }
    }
}
