//
//  RECAPIError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public let kRECAPIErrorDomain: String = "RECAPIError"

protocol RECAPIError: RECError {}

extension RECAPIError {
    static public var errorDomain: String {
        return kRECAPIErrorDomain
    }
}
