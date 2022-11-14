//
//  RECAPIQueueItem.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 11.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECAPIQueueItem: NSObject {
    let request: RECAPIRequest
    private let completionHandler: (Result<Data, Error>) -> Void
    private(set) var isCompleted: Bool = false
    
    // MARK: Init
    
    init(
        request: RECAPIRequest,
        completionHandler: @escaping (Result<Data, Error>) -> Void
    ) {
        self.request = request
        self.completionHandler = completionHandler
    }
    
    // MARK: Completion
    
    func complete(with result: Result<Data, Error>) {
        guard isCompleted == false else {
            return
        }
        isCompleted = true
        completionHandler(result)
    }
}
