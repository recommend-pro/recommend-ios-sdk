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
    private let queue: RECAPIQueue
    
    // MARK: Init
    
    init(config: RECConfig) {
        self.config = config
        self.queue = RECAPIQueue()
    }
    
    // MARK: Prepare methods
    
    private func buildURLRequest(for request: RECAPIRequest) throws -> URLRequest {
        return try request.buildURLRequest(host: self.config.apiHost)
    }
    
    // MARK: DataTask
    
    private func execute(task: RECAPIDataTask) {
        task.resume()
    }
    
    // MARK: Queue
    
    private func addToQueue(_ task: RECAPIDataTask) {
        queue.add(task)
        if queue.count == 1 {
            executeNextTask()
        }
    }
    
    @discardableResult
    private func executeNextTask() -> RECAPIDataTask? {
        guard let task = queue.next() else {
            return nil
        }
        execute(task: task)
        return task
    }
    
    private func process(
        request: RECAPIRequest,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        do {
            let urlRequest = try self.buildURLRequest(for: request)
            
            let waypointCompletion: (Result<Data, Error>) -> Void = { result in
                if case .success = result, request.isAttemptsLimitExceeded == false {
                    self.process(request: request, completion: completion)
                    return
                }
                
                completion(result)
            }
            
            let task = self.dataTask(urlRequest: urlRequest, completion: waypointCompletion)
            
            if request.isQueueRequired {
                addToQueue(task)
            } else {
                execute(task: task)
            }
        } catch {
            completion(.failure(error))
        }
    }
    
    // MARK: Execute Request
    
    func execute(
        request: RECAPIRequest,
        completion: @escaping (Error?) -> Void
    ) {
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
        
        process(request: request, completion: waypointCompletion)
    }
    
    func execute<T>(
        request: RECAPIRequest,
        completion: @escaping (Result<T, Error>) -> Void
    ) where T : Decodable {
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
        
        process(request: request, completion: waypointCompletion)
    }
}

// MARK: - API DataTask

private extension RECAPIClient {
    func dataTask(
        urlRequest: URLRequest,
        completion: @escaping (Result<Data, Error>) -> Void
    ) -> RECAPIDataTask {
        return RECAPIDataTask(urlRequest: urlRequest,
                              urlSession: self.urlSession,
                              completion: completion)
    }
}
