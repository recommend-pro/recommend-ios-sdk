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
    public typealias ErrorCode = RECAPIErrorResponseCode
    
    case nilURL(URLComponents)
    case invalidURLResponse(URLResponse?)
    case nilData
    case errorResponse(errorCode: ErrorCode, errorMessage: String)
    case serverError(_ statusCode: Int)
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
            
        case .invalidURLResponse(let urlResponse):
            userInfo["urlResponse"] = urlResponse
            
        case .errorResponse(let errorCode, let errorMessage):
            userInfo["errorCode"] = errorCode
            userInfo["errorMessage"] = errorMessage
            
        case .serverError(let statusCode):
            userInfo["statusCode"] = statusCode
            
        default:
            break
        }
        
        return userInfo
    }
}
