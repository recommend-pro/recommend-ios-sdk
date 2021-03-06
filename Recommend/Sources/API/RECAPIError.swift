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
    
    case nilURL(host: String, endpoint: RECAPIEndpoint)
    case invalidURLResponse(URLResponse?)
    case nilData
    case errorResponse(errorCode: ErrorCode, errorMessage: String)
    case serverError(_ statusCode: Int)
    case attemptsLimitExceed(request: RECAPIRequest, lastAttemptError: Error? = nil)
}

extension RECAPIError: CustomNSError {
    public static var errorDomain: String {
        return RECAPIErrorDomain
    }
    
    public var errorUserInfo: [String: Any] {
        var userInfo: [String: Any] = [:]
        
        switch self {
        case .nilURL(let host, let endpoint):
            userInfo["host"] = host
            userInfo["path"] = endpoint.path
            userInfo["query"] = endpoint.queryItems
            
        case .invalidURLResponse(let urlResponse):
            userInfo["urlResponse"] = urlResponse
            
        case .errorResponse(let errorCode, let errorMessage):
            userInfo["errorCode"] = errorCode
            userInfo["errorMessage"] = errorMessage
            
        case .serverError(let statusCode):
            userInfo["statusCode"] = statusCode
            
        case .attemptsLimitExceed(let request, let lastAttemptError):
            userInfo["url"] = request.urlRequest.url?.absoluteString
            userInfo["attemptsLimit"] = request.attemptsLimit
            if let nsError = lastAttemptError as? NSError {
                nsError.userInfo.forEach({
                    userInfo[$0.key] = $0.value
                })
            }
            
            
        default:
            break
        }
        
        return userInfo
    }
}
