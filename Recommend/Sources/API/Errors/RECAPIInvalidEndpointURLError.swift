//
//  RECAPIInvalidEndpointURLError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECAPIInvalidEndpointURLError: RECAPIError {
    let urlComponents: URLComponents
    
    public var errorCode: Int {
        RECAPIErrorCodes.invalidEndpoint.rawValue
    }
    
    public var errorUserInfo: [String: Any] {
        return [
            "host": urlComponents.host ?? "",
            "path": urlComponents.path,
            "query": urlComponents.query ?? ""
        ]
    }
    
    public var errorDescription: String? {
        "URL is not generated for API endpoint."
    }
}
