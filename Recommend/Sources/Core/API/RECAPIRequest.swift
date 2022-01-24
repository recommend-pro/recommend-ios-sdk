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
    public var headers: [String: String]?
    public var httpBody: Data?
    
    // MARK: Init
    
    public init(endpoint: RECAPIEndpoint,
        self.endpoint = endpoint
    }
    
    
    // MARK: URLRequest
    
    func buildURLRequest(host: String) throws -> URLRequest {
        let url = try endpoint.buildURL(host: host)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.httpMethod
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = httpBody
        return urlRequest
    }
}
