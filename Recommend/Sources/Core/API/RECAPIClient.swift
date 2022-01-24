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
    
    func execute(request: RECAPIRequest, completion: @escaping (Error?) -> Void) {
        let waypointCompletion: (Result<Data, Error>) -> Void = { result in
            do {
                switch result {
                case .success(let data):
                    _ = try JSONDecoder().decode(RECAPISuccessResponse.self, from: data)
                    completion(nil)
                    
                case .failure(let error):
                    throw error
                }
            } catch {
                completion(error)
            }
        }
        
        executeDataTask(with: request, completion: waypointCompletion)
    }
    
    func execute<T>(request: RECAPIRequest, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        let waypointCompletion: (Result<Data, Error>) -> Void = { result in
            do {
                switch result {
                case .success(let data):
                    let successResponse = try JSONDecoder().decode(RECAPIDataSuccessResponse<T>.self, from: data)
                    completion(.success(successResponse.result))
                    
                case .failure(let error):
                    completion(.failure(error))
                }
            } catch {
                completion(.failure(error))
            }
        }
        
        executeDataTask(with: request, completion: waypointCompletion)
    }
    
    private func executeDataTask(with request: RECAPIRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        do {
            let urlRequest = try self.buildURLRequest(for: request)
            
            let waypointCompletion: (Result<Data, Error>) -> Void = { result in
                if case .success = result, request.isAttemptsLimitExceeded == false {
                    self.executeDataTask(with: request, completion: completion)
                    return
                }
                
                completion(result)
            }
            
            request.nextAttempt()
            let dataTask = self.dataTask(urlRequest: urlRequest, completion: waypointCompletion)
            dataTask.resume()
        } catch {
            completion(.failure(error))
        }
    }
}

// MARK: - API DataTask

extension RECAPIClient {
    func dataTask(urlRequest: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) -> RECAPIDataTask {
        return RECAPIDataTask(urlRequest: urlRequest,
                              urlSession: self.urlSession,
                              completion: completion)
    }
}
