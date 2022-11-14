//
//  RECCoreError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 06.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

let kRECCoreErrorDomain: String = "RECCoreError"

public protocol RECCoreError: RECError { }

// MARK: CustomNSError

extension RECCoreError {
    static public var errorDomain: String {
        return kRECCoreErrorDomain
    }
}
