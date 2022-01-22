//
//  RECAPIClient.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECAPIClient: NSObject {
    private let config: RECConfig
    private var urlSession: URLSession {
        return config.urlSession
    }
    
    // MARK: Init
    
    init(config: RECConfig) {
        self.config = config
    }
    
    // MARK: Prepare methods
    
    private func buildURLRequest(for request: RECAPIRequest) throws -> URLRequest {
        return try request.buildURLRequest(host: self.config.apiHost)
    }
    
    // MARK: Execute
    
    func execute(request: RECAPIRequest, completion: @escaping () -> Void) {
        do {
            let urlRequest = try self.buildURLRequest(for: request)
            let dataTask = self.dataTask(urlRequest: urlRequest, completion: completion)
            dataTask.resume()
        } catch {
            print(error)
            completion()
        }
    }
}

// MARK: - API DataTask

extension RECAPIClient {
    func dataTask(urlRequest: URLRequest, completion: @escaping () -> Void) -> RECAPIDataTask {
        return RECAPIDataTask(urlRequest: urlRequest,
                              urlSession: self.urlSession,
                              completion: completion)
    }
}
