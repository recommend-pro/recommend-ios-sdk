//
//  RECAttributeUnexpectedValue.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 09.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECAttributeUnexpectedValue: RECAttributeError {
    public var errorCode: Int {
        RECAttributeErrorCodes.unexpectedValue.rawValue
    }
    
    public var errorDescription: String? {
        "Unexpected attribute value type received from API."
    }
    
    public var failureReason: String? {
        "Attributed value can't be decoded, because it's type is not supported."
    }
}
