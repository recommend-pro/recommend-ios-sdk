//
//  RECMessagingNilApplicationNameError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 11.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECMessagingNilApplicationNameError: RECMessagingError {
    
    public var errorCode: Int {
        RECMessagingErrorCodes.nilApplicationName.rawValue
    }
    
    public var errorDescription: String? {
        "Application name is not provided."
    }
    
    public var helpAnchor: String? {
        "Provide the non-empty application name to configuration (for initalization)."
    }
}
