//
//  RECAPIClient.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECAPIClient: NSObject {
    private let host: String
    private var urlSession: URLSession
    
    // MARK: Init
    
    init(
        host: String,
        urlSession: URLSession = .shared
    ) {
        self.host = host
        self.urlSession = urlSession
    }
    
    // MARK: Prepare methods
    
    private func buildURLRequest(for request: RECAPIRequest) throws -> URLRequest {
        return try request.buildURLRequest(host: self.host)
    }
    
    // MARK: DataTask
    
    private func dataTask(
        with request: URLRequest,
        completion: @escaping (Result<Data, Error>) -> Void
    ) -> URLSessionDataTask {
        return urlSession.dataTask(with: request) { data, urlResponse, error in
            do {
                if let error = error {
                    throw error
                }
                
                guard
                    let urlResponse = urlResponse,
                    let httpURLResponse = urlResponse as? HTTPURLResponse
                else {
                    throw RECAPIError.invalidURLResponse(urlResponse)
                }
                
                let statusCode = httpURLResponse.statusCode
                
                switch statusCode {
                case 200:
                    guard let data = data else {
                        throw RECAPIError.nilData
                    }
                    completion(.success(data))
                    
                default:
                    guard let data = data else {
                        throw RECAPIError.serverError(statusCode)
                    }
                    
                    let errorResponse = try JSONDecoder().decode(
                        RECAPIErrorResponse.self,
                        from: data)
                    throw RECAPIError.errorResponse(
                        errorCode: errorResponse.errorCode,
                        errorMessage: errorResponse.errorMessage)
                }
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    private func resumeDataTask(
        with request: RECAPIRequest,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        do {
            let urlRequest = try self.buildURLRequest(for: request)
            
            let dataTask = self.dataTask(
                with: urlRequest,
                completion: completion)
            
            dataTask.resume()
        } catch {
            completion(.failure(error))
        }
    }
    
    private func process(
        request: RECAPIRequest,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        guard request.isAttemptsLimitExceeded == false else {
            let error = RECAPIError.attemptsLimitExceed(
                request: request,
                lastAttemptError: nil)
            completion(.failure(error))
            return
        }
        
        if request.attemptsLimit > 1 {
            let dataTaskCompletion: (Result<Data, Error>) -> Void = { result in
                switch result {
                case .success:
                    completion(result)
                    
                case .failure(let error):
                    request.nextAttempt()
                    guard request.isAttemptsLimitExceeded == false else {
                        let error = RECAPIError.attemptsLimitExceed(
                            request: request,
                            lastAttemptError: error)
                        completion(.failure(error))
                        return
                    }
                    self.process(
                        request: request,
                        completion: completion)
                }
            }
            resumeDataTask(with: request,
                           completion: dataTaskCompletion)
        } else {
            resumeDataTask(with: request,
                           completion: completion)
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
