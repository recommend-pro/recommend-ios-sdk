//
//  RECMessagingError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

let kRECMessagingErrorDomain: String = "RECMessagingError"

public protocol RECMessagingError: RECError { }

// MARK: CustomNSError

extension RECMessagingError {
    static public var errorDomain: String {
        return kRECMessagingErrorDomain
    }
}
