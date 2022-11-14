//
//  RECAPIClient.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import WebKitUserAgent

final class RECAPIClient: NSObject {
    private typealias RequestProcessingCompletion = (Result<Data, Error>) -> Void
    
    private let host: String
    private let queue: RECAPIQueue
    private var activeQueueItem: RECAPIQueueItem?
    
    private let urlSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration)
    }()
    
    // MARK: Init
    
    init(configuration: RECAPIConfiguration) {
        guard configuration.host.isEmpty == false else {
            let error = RECAPIInvalidHostError()
            fatalError(error.localizedDescription)
        }
        self.host = configuration.host
        self.queue = RECAPIQueue()
    }
    
    // MARK: HTTP Client
    
    private func resumeDataTask(
        urlRequest: URLRequest,
        completionHandler: @escaping (Result<Data, Error>) -> Void
    ) {
        let dataTask = urlSession.dataTask(with: urlRequest) { data, urlResponse, error in
            do {
                if let error = error {
                    throw error
                }
                
                guard let httpResponse = urlResponse as? HTTPURLResponse else {
                    throw RECAPIInvalidResponseError(response: urlResponse)
                }
                
                guard let data = data else {
                    throw RECAPIUnexpectedResponseError(response: httpResponse)
                }
                
                let apiResponse = try JSONDecoder().decode(
                    RECAPIBaseResponse.self,
                    from: data)
                
                if apiResponse.success == false {
                    let failureAPIResponse = try JSONDecoder().decode(
                        RECAPIErrorResponse.self,
                        from: data)
                    throw RECAPIErrorResponseError(response: failureAPIResponse)
                } else {
                    return completionHandler(.success(data))
                }
            } catch {
                completionHandler(.failure(error))
            }
        }
        dataTask.resume()
    }
    
    // MARK: Queue items processing
    
    private func addQueueItem(_ queueItem: RECAPIQueueItem) {
        self.queue.add(queueItem)
        if activeQueueItem == nil {
            processNextQueueItem()
        }
    }
    
    private func processNextQueueItem() {
        guard activeQueueItem == nil else {
            return
        }
        
        guard
            let queueItem = queue.next(),
            queueItem.isCompleted == false
        else {
            return
        }
        
        if queueItem.request.isAttemptsLimitExceeded {
            let error = queueItem.request.lastAttemptError ?? RECAPIRequestAttemptsLimitExceededError(request: queueItem.request)
            queueItem.complete(with: .failure(error))
            return
        }
        
        activeQueueItem = queueItem
        
        resumeDataTask(urlRequest: queueItem.request.urlRequest) { result in
            self.activeQueueItem = nil
            
            if
                case .failure(let error) = result,
                !(error is RECAPIErrorResponseError)
            {
                queueItem.request.setLastAttemptError(error)
                
                if queueItem.request.tryNextAttempt() {
                    self.addQueueItem(queueItem)
                }
                
                return
            }
            
            queueItem.complete(with: result)
            self.activeQueueItem = nil
            self.processNextQueueItem()
        }
    }
    
    // MARK: Request processing
    
    private func createAndProcessRequest(
        for endpoint: RECAPIEndpoint,
        with body: Data? = nil,
        completionHandler: @escaping RequestProcessingCompletion
    ) {
        do {
            let request = try RECAPIRequest(
                host: host,
                endpoint: endpoint,
                body: body)
            
            guard let userAgent = WKUserAgent.default else {
                throw RECAPINilUserAgentError()
            }
            request.setUserAgent(userAgent)
            
            let queueItem = RECAPIQueueItem(
                request: request,
                completionHandler: completionHandler)
            self.addQueueItem(queueItem)
        } catch {
            completionHandler(.failure(error))
        }
    }
    
    func processRequest(
        for endpoint: RECAPIEndpoint,
        with body: Data? = nil,
        completionHandler: @escaping (Error?) -> Void
    ) {
        let wrappedCompletionHandler: RequestProcessingCompletion = { result in
            switch result {
            case .success:
                completionHandler(nil)
            case .failure(let error):
                completionHandler(error)
            }
        }
        
        createAndProcessRequest(
            for: endpoint,
            with: body,
            completionHandler: wrappedCompletionHandler)
    }
    
    func processRequest<T>(
        for endpoint: RECAPIEndpoint,
        with body: Data? = nil,
        completionHandler: @escaping (Result<T, Error>) -> Void
    ) where T: Decodable {
        let wrappedCompletionHandler: RequestProcessingCompletion = { result in
            do {
                switch result {
                case .success(let data):
                    let successResponse = try JSONDecoder().decode(
                        RECAPIDataResponse<T>.self,
                        from: data)
                    completionHandler(.success(successResponse.result))
                case .failure(let error):
                    throw error
                }
            } catch {
                completionHandler(.failure(error))
            }
        }
        
        createAndProcessRequest(
            for: endpoint,
            with: body,
            completionHandler: wrappedCompletionHandler)
    }
}
