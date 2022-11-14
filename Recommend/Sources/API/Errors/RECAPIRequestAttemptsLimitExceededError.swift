//
//  RECAPIRequestAttemptsLimitExceededError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 11.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECAPIRequestAttemptsLimitExceededError: RECAPIError {
    private let request: RECAPIRequest
    
    // MARK: Init
    
    init(request: RECAPIRequest) {
        self.request = request
    }
    
    // MARK: Error
    
    public var errorCode: Int {
        RECAPIErrorCodes.requestAttemptsLimitExceeded.rawValue
    }
    
    public var errorDescription: String? {
        "API request attempts limit exceeded."
    }
    
    public var failureReason: String? {
        errorDescription
    }
    
    public var errorUserInfo: [String: Any] {
        [
            "url": request.urlRequest.url?.absoluteString ?? "",
            "attemptsLimit": request.attemptsLimit
        ]
    }
}
