//
//  RECDevice.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UIKit

public final class RECDevice {
    private typealias APIService = RECDeviceAPIService
    
    private let core: RECCore
    private let apiService: APIService
    
    private var config: RECConfig {
        return core.config
    }
    private var environment: RECEnvironment {
        return core.environment
    }
    
    // MARK: Int
    
    init(core: RECCore) {
        self.core = core
        self.apiService = APIService(core: core)
    }
    
    // MARK: Track Device Activity
    
    private func trackDeviceActivity(_ deviceActivity: RECDeviceActivity,
                                     completion: ((Error?) -> Void)? = nil) {
        apiService.trackDeviceActivity(deviceActivity) { error in
            completion?(error)
        }
    }
    
    public func trackDeviceActivity(activity: [RECActivity],
                                    eventTime: Date = Date(),
                                    completion: ((Error?) -> Void)? = nil) {
        let eventTime = Int(eventTime.timeIntervalSince1970)
        let deviceActivity = RECDeviceActivity(customerIdHash: environment.customerIdHash,
                                               store: environment.store,
                                               currency: environment.currency,
                                               environment: environment.environment,
                                               priceList: environment.priceList?.code,
                                               eventTime: eventTime,
                                               metrics: environment.metrics,
                                               activity: activity)
        self.trackDeviceActivity(deviceActivity,
                                 completion: completion)
    }
    
    // MARK: Update Device
    
    public func updateDevice(completion: ((Error?) -> Void)? = nil) {
        let isFirstLaunch: Bool = config.isFirstLaunch ?? true
        let activityData: RECActivityUpdateDeviceData = .default(firstLaunch: isFirstLaunch)
        let activity: RECActivity = .updateDevice(activityData)
        
        trackDeviceActivity(activity: [activity],
                            eventTime: Date(),
                            completion: completion)
    }
}
