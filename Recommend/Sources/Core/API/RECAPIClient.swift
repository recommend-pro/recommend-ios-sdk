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
}
