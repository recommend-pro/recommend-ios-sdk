//
//  RECAttributeError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 09.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

let kRECAttributeErrorDomain: String = "RECAttributeError"

public protocol RECAttributeError: RECError { }

extension RECAttributeError {
    static public var errorDomain: String {
        return kRECAttributeErrorDomain
    }
}
