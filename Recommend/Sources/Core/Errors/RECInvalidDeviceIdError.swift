//
//  RECInvalidDeviceIdError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECInvalidDeviceIdError: RECCoreError {
    let deviceId: String?
    
    public var errorCode: Int {
        RECCoreErrorCodes.invalidDeviceId.rawValue
    }
    
    public var errorDescription: String? {
        "Device id is not received or is invalid."
    }
    
    public var failureReason: String? {
        "Current UIDevice returns invalid or no IDFV (UUID identifier for vendor)."
    }
    
    public var recoverySuggestion: String? {
        "Retry get the Device Id value later."
    }
}
