//
//  RECAPIURLBuilder.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECAPIURLBuilder {
    static func buildURL(
        host: String,
        endpoint: RECAPIEndpoint
    ) throws -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.queryItems
        guard let url = urlComponents.url else {
            throw RECAPIInvalidEndpointURLError(urlComponents: urlComponents)
        }
        return url
    }
}
