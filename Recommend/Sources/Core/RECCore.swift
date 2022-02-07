//
//  RECCore.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECCore: NSObject {
    public let config: RECConfig
    public let environment: RECEnvironment
    
    private let apiClient: RECAPIClient
    
    // MARK: Init
    
    init(config: RECConfig) {
        self.config = config
        self.environment = RECEnvironment()
        self.apiClient = RECAPIClient(config: config)
    }
    
    // MARK: API
    
    public func execute(apiRequest: RECAPIRequest,
                        completion: @escaping (Error?) -> Void) {
        apiClient.execute(request: apiRequest, completion: completion)
    }
    
    public func execute<T>(apiRequest: RECAPIRequest,
                           completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        apiClient.execute(request: apiRequest, completion: completion)
    }
}
