//
//  RECAPIDataTask.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 20.01.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECAPIDataTask {
    private let urlRequest: URLRequest
    private let urlSession: URLSession
    private let completion: (Result<Data, Error>) -> Void
    
    private lazy var dataTask: URLSessionDataTask = {
        return urlSession.dataTask(with: urlRequest) { data, urlResponse, error in
            self.handleCompletion(data: data,
                                  urlResponse: urlResponse,
                                  error: error)
        }
    }()
    
    // MARK: Init
    
    init(urlRequest: URLRequest,
         urlSession: URLSession,
         completion: @escaping (Result<Data, Error>) -> Void) {
        self.urlRequest = urlRequest
        self.urlSession = urlSession
        self.completion = completion
    }
    
    // MARK: Completion
    
    private func handleCompletion(data: Data?, urlResponse: URLResponse?, error: Error?) {
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
                
            case 400, 401, 404:
                guard let data = data else {
                    throw RECAPIError.nilData
                }
                let errorResponse = try JSONDecoder().decode(RECAPIErrorResponse.self, from: data)
                throw RECAPIError.errorResponse(errorCode: errorResponse.errorCode,
                                                errorMessage: errorResponse.errorMessage)
                
            default:
                throw RECAPIError.serverError(statusCode)
            }
        } catch {
            completion(.failure(error))
        }
    }
    
    // MARK: URLSessionDataTask
    
    func resume() {
        dataTask.resume()
    }
    
    func cancel() {
        dataTask.cancel()
    }
}
