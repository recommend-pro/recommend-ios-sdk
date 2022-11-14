//
//  RECAPIRequestt.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECAPIRequest: NSObject {
    private(set) var urlRequest: URLRequest
    let attemptsLimit: Int
    private(set) var attempt: Int = 0
    private(set) var lastAttemptError: Error?
    
    var isAttemptsLimitExceeded: Bool {
        return attempt >= attemptsLimit
    }
    
    // MARK: Init
    
    init(
        host: String,
        endpoint: RECAPIEndpoint,
        body: Data?
    ) throws {
        let url = try RECAPIURLBuilder.buildURL(
            host: host,
            endpoint: endpoint)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue
        urlRequest.httpBody = body
        endpoint.headers?.forEach { header in
            urlRequest.addValue(
                header.value,
                forHTTPHeaderField: header.key)
        }
        self.urlRequest = urlRequest
        self.attemptsLimit = endpoint.attemptsLimit
    }
    
    // MARK: Attempt
    
    @discardableResult
    func tryNextAttempt() -> Bool {
        attempt += 1
        return isAttemptsLimitExceeded
    }
    
    func setLastAttemptError(_ error: Error) {
        self.lastAttemptError = error
    }
    
    // MARK: User-Agent
    
    func setUserAgent(_ userAgent: String) {
        urlRequest.setValue(
            userAgent,
            forHTTPHeaderField: "User-Agent")
    }
}
