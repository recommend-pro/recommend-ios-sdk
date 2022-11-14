//
//  RECAPIUnexpectedResponse.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECAPIUnexpectedResponseError: RECAPIError {
    let response: HTTPURLResponse
    
    public var errorCode: Int {
        RECAPIErrorCodes.unexpectedResponse.rawValue
    }
    
    public var errorDescription: String? {
        HTTPURLResponse.localizedString(forStatusCode: response.statusCode)
    }
    
    public var errorUserInfo: [String: Any] {
        return [
            "status-code": response.statusCode,
            "url": response.url?.absoluteString ?? ""
        ]
    }
}
