//
//  RECAPIError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

private let RECAPIErrorDomain = "RECAPIErrorDomain"

public enum RECAPIError: Error {
    case nilURL(URLComponents)
}

extension RECAPIError: CustomNSError {
    public static var errorDomain: String {
        return RECAPIErrorDomain
    }
    
    public var errorUserInfo: [String: Any] {
        var userInfo: [String: Any] = [:]
        
        switch self {
        case .nilURL(let urlComponents):
            userInfo["host"] = urlComponents.host
            userInfo["path"] = urlComponents.path
            userInfo["query"] = urlComponents.query
        }
        
        return userInfo
    }
}
