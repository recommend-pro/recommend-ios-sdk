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
    public let device: RECDevice
    public let recommendation: RECRecommendation
    
    // MARK: Init
    
    public init(appName: String,
                appId: String,
                apiHost: String = kRECDefaultAPIHost) {
        let config = RECConfig(appName: appName,
                               appId: appId,
                               apiHost: apiHost)
        self.core = RECCore(config: config)
        self.device = RECDevice(core: core)
        self.recommendation = RECRecommendation(core: core)
    }
    
    // MARK: Device
    
    public func trackDeviceActivity(activity: [RECActivity],
                                    eventTime: Date = Date(),
                                    completion: @escaping (Error?) -> Void) {
        device.trackActivity(activity: activity,
                             eventTime: eventTime,
                             completion: completion)
    }
    
    // MARK: Recommendation
    
    public func fetchPanels(model: RECRecommendationPanelsFetchModel,
                            completion: @escaping (Result<[RECRecommendationPanel], Error>) -> Void) {
        recommendation.fetchPanels(with: model, completion: completion)
    }
}
