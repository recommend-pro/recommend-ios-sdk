//
//  RECConfig.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UIKit

public let kRECDefaultAPIHost = "api.recommend.pro"

public struct RECConfig {
    
    public let accountId: String
    public let applicationName: String?
    public let apiHost: String
    
    // MARK: Init
    
    init(
        accountId: String,
        applicationName: String? = nil,
        apiHost: String = kRECDefaultAPIHost
    ) {
        self.accountId = accountId
        self.applicationName = applicationName
        self.apiHost = apiHost
    }
}
