//
//  RECAPIEndpoint.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECAPIEndpoint {
    public let path: String
    public var queryItems: [URLQueryItem]?
    public let httpMethod: String
    public let headers: [String: String]
    
    // MARK: Init
    
    public init(
        path: String,
        queryItems: [URLQueryItem]? = nil,
        httpMethod: String,
        headers: [String: String] = [:]
    ) {
        self.path = path
        self.queryItems = queryItems
        self.httpMethod = httpMethod
        self.headers = headers
    }
    
    // MARK: URL
    
    func url(withHost host: String) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        return urlComponents.url
    }
}
