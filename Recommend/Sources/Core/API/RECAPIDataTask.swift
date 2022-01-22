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
    private let completion: () -> Void
    
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
         completion: @escaping () -> Void) {
        self.urlRequest = urlRequest
        self.urlSession = urlSession
        self.completion = completion
    }
    
    // MARK: Completion
    
    private func handleCompletion(data: Data?, urlResponse: URLResponse?, error: Error?) {
        completion()
    }
    
    // MARK: URLSessionDataTask
    
    func resume() {
        dataTask.resume()
    }
    
    func cancel() {
        dataTask.cancel()
    }
}
