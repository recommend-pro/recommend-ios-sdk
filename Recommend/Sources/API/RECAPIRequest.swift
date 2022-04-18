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
    let urlRequest: URLRequest

    
    // multi-attempt
    let attemptsLimit: Int
    private(set) var attempt: Int = 0
    var isAttemptsLimitExceeded: Bool {
        return attempt >= attemptsLimit
    }
    
    // MARK: Init
    
    public init(
        urlRequest: URLRequest,
        attemptsLimit: Int
    ) {
        self.urlRequest = urlRequest
        self.attemptsLimit = attemptsLimit
    }
    
    public convenience init(
        url: URL,
        httpMethod: String,
        httpBody: Data? = nil,
        headers: [String: String]? = nil,
        attemptsLimit: Int
    ) {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod
        urlRequest.httpBody = httpBody
        urlRequest.allHTTPHeaderFields = headers
        
        self.init(
            urlRequest: urlRequest,
            attemptsLimit: attemptsLimit)
    }
    
    // MARK: Attempt
    
    @discardableResult
    func nextAttempt() -> Bool {
        attempt += 1
        return isAttemptsLimitExceeded
    }
}
