//
//  RECAPIInvalidURLResponse.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECAPIInvalidResponseError: RECAPIError {
    let response: URLResponse?
    
    public var errorCode: Int {
        RECAPIErrorCodes.invalidResponse.rawValue
    }
    
    public var errorDescription: String? {
        if response != nil {
            return "URLResponse is invalid."
        } else {
            return "URLResponse is not received."
        }
    }
}
