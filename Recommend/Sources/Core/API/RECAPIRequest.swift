//
//  RECAPIRequestt.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECAPIRequest: NSObject {
    public var endpoint: RECAPIEndpoint
    public var queryItems: [URLQueryItem]?
    public var headers: [String: String]?
    public var httpBody: Data?
    
    // MARK: Init
    
    public init(endpoint: RECAPIEndpoint,
                queryItems: [URLQueryItem]? = nil,
                httpBody: Data? = nil) {
        self.endpoint = endpoint
        self.httpBody = httpBody
    }
    
    // MARK: URLRequest
    
    private func buildURL(host: String) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = queryItems
        return urlComponents.url
    }
    
    func buildURLRequest(host: String) -> URLRequest? {
        guard let url = buildURL(host: host) else {
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.httpMethod
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = httpBody
        return urlRequest
    }
}
