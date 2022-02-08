//
//  Recommend.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class Recommend: NSObject {
    private let core: RECCore
    public let recommendation: RECRecommendation
    
    // MARK: Init
    
    public init(appName: String,
                appId: String,
                apiHost: String = kRECDefaultAPIHost) {
        let config = RECConfig(appName: appName,
                               appId: appId,
                               apiHost: apiHost)
        self.core = RECCore(config: config)
        self.recommendation = RECRecommendation(core: core)
    }
    
    // MARK: Device Id
    
    public func deviceId() throws -> String {
        return try core.config.deviceId()
    }
}
