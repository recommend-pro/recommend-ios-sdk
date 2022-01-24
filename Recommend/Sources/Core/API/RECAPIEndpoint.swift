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
    
    // MARK: Init
    
    public init(path: String,
                queryItems: [URLQueryItem]? = nil,
                httpMethod: String) {
        self.path = path
        self.httpMethod = httpMethod
    }
    
    // MARK: URL
    
    func buildURL(host: String) throws -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            throw RECAPIError.nilURL(urlComponents)
        }
        return url
    }
}
