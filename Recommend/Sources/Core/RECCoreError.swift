//
//  RECCoreError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 24.01.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

private let RECCoreErrorDomain = "RECCoreErrorDomain"

public enum RECCoreError: Error {
    case nilDeviceId
}

extension RECCoreError: CustomNSError {
    public static var errorDomain: String {
        return RECCoreErrorDomain
    }
}
