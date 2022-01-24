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
    private let apiClient: RECAPIClient
    
    // MARK: Init
    
    init(config: RECConfig) {
        self.config = config
        self.apiClient = RECAPIClient(config: config)
    }
}
