//
//  RECAPIEndpoint.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

let kRECAPIRequestAttemptsLimit: Int = 1

struct RECAPIEndpoint {
    let method: RECHTTPMethod
    let path: String
    let queryItems: [URLQueryItem]?
    let headers: [String: String]?
    let attemptsLimit: Int
    
    // MARK: Init
    
    init(
        method: RECHTTPMethod,
        path: String,
        queryItems: [URLQueryItem]? = nil,
        headers: [String: String]? = nil,
        attemptsLimit: Int = kRECAPIRequestAttemptsLimit
    ) {
        self.path = path
        self.queryItems = queryItems
        self.method = method
        self.headers = headers
        self.attemptsLimit = attemptsLimit
    }
    
    init(
        method: RECHTTPMethod,
        path: String,
        queryItems: [String: String],
        headers: [String: String]? = nil,
        attemptsLimit: Int = kRECAPIRequestAttemptsLimit
    ) {
        let wrappedQueryItems: [URLQueryItem]? = queryItems.reduce(into: []) { partialResult, item in
            partialResult.append(
                URLQueryItem(
                    name: item.key,
                    value: item.value)
            )
        }
        self.init(
            method: method,
            path: path,
            queryItems: wrappedQueryItems,
            headers: headers,
            attemptsLimit: attemptsLimit)
    }
}
