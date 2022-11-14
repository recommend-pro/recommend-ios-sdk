//
//  RECAPIErrorResponseError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECAPIErrorResponseError: RECAPIError {
    let response: RECAPIErrorResponse
    
    public var errorCode: Int {
        RECAPIErrorCodes.errorResponse.rawValue
    }
    
    public var errorDescription: String? {
        response.errorMessage
    }
}
