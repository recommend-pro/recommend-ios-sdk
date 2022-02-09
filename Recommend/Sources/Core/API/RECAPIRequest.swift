//
//  RECAPIRequestt.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public let kRECAPIRequestDefaultAttemptsLimit: Int = 1

public final class RECAPIRequest: NSObject {
    public let endpoint: RECAPIEndpoint
    public var httpBody: Data?
    
    // queue
    public let isQueueRequired: Bool
    
    // multi-attempt
    public let attemptsLimit: Int
    public private(set) var attempt: Int = 0
    public var isAttemptsLimitExceeded: Bool {
        return attempt < attemptsLimit
    }
    
    // MARK: Init
    
    public init(
        endpoint: RECAPIEndpoint,
        isQueueRequired: Bool = true,
        attemptsLimit: Int = kRECAPIRequestDefaultAttemptsLimit
    ) {
        self.endpoint = endpoint
        self.isQueueRequired = isQueueRequired
        self.attemptsLimit = attemptsLimit
    }
    
    // MARK: Attempt
    
    @discardableResult
    func nextAttempt() -> Bool {
        attempt += 1
        return isAttemptsLimitExceeded
    }
    
    // MARK: URLRequest
    
    func buildURLRequest(host: String) throws -> URLRequest {
        let url = try endpoint.buildURL(host: host)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.httpMethod
        urlRequest.allHTTPHeaderFields = endpoint.headers
        urlRequest.httpBody = httpBody
        return urlRequest
    }
}
