//
//  RECAPIClient.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECAPIClient: NSObject {
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
    
    // MARK: Request
    
    private func request(
        with endpoint: RECAPIEndpoint,
        httpBody: Data? = nil,
        attemptsLimit: Int
    ) throws -> RECAPIRequest {
        guard let url = endpoint.url(withHost: self.host) else {
            let error = RECAPIError.nilURL(
                host: self.host,
                endpoint: endpoint)
            throw error
        }
        
        return RECAPIRequest(
            url: url,
            httpMethod: endpoint.httpMethod,
            httpBody: httpBody,
            headers: endpoint.headers,
            attemptsLimit: attemptsLimit)
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
        let dataTask = self.dataTask(
            with: request.urlRequest,
            completion: completion)
        
        dataTask.resume()
    }
    
    // MARK: Execute Request
    
    func executeRequest(
        _ request: RECAPIRequest,
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
                    self.executeRequest(
                        request,
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
    
    public func executeRequest(
        with endpoint: RECAPIEndpoint,
        httpBody: Data? = nil,
        attemptsLimit: Int = kRECAPIRequestDefaultAttemptsLimit,
        completion: @escaping (Error?) -> Void
    ) {
        do {
            let request = try self.request(
                with: endpoint,
                httpBody: httpBody,
                attemptsLimit: attemptsLimit)
            
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
            
            executeRequest(
                request,
                completion: waypointCompletion)
        } catch {
            completion(error)
        }
    }
    
    public func executeRequest<T>(
        with endpoint: RECAPIEndpoint,
        httpBody: Data? = nil,
        attemptsLimit: Int = kRECAPIRequestDefaultAttemptsLimit,
        completion: @escaping (Result<T, Error>) -> Void
    ) where T : Decodable {
        do {
            let request = try self.request(
                with: endpoint,
                httpBody: httpBody,
                attemptsLimit: attemptsLimit)
            
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
            
            executeRequest(
                request,
                completion: waypointCompletion)
        } catch {
            completion(.failure(error))
        }
    }
}
