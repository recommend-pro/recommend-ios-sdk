//
//  RECConfigError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 24.01.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

private let RECConfigErrorDomain = "RECConfigErrorDomain"

public enum RECConfigError: Error {
    case nilDeviceId
}

extension RECConfigError: CustomNSError {
    public static var errorDomain: String {
        return RECConfigErrorDomain
    }
}
