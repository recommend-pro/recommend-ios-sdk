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
    private let core: RECCore
    private let apiService: RECDeviceAPIService
    
    private var parameters: RECParameters {
        return core.parameters
    }
    
    // MARK: Int
    
    init(core: RECCore) {
        self.core = core
        self.apiService = RECDeviceAPIService(core: core)
    }
    
    // MARK: Track Device Activity
    
    private func trackActivity(_ deviceActivity: RECDeviceActivity, completion: @escaping (Error?) -> Void) {
        apiService.trackDeviceActivity(deviceActivity, completion: completion)
    }
    
    public func trackActivity(activity: [RECActivity],
                              eventTime: Date = Date(),
                              completion: @escaping (Error?) -> Void) {
        let eventTime = Int(eventTime.timeIntervalSince1970)
        let deviceActivity = RECDeviceActivity(customerIdHash: parameters.customerIdHash,
                                               store: parameters.store,
                                               currency: parameters.currency,
                                               environment: parameters.environment,
                                               priceList: parameters.priceList,
                                               eventTime: eventTime,
                                               metrics: parameters.metrics,
                                               activity: activity)
        self.trackActivity(deviceActivity, completion: completion)
    }
    
    // MARK: Update Device
    
    public func updateDevice() {
        let activityData: RECActivityUpdateDeviceData = .default(firstLaunch: false)
        let activity: RECActivity = .updateDevice(activityData)
        trackActivity(activity: [activity], eventTime: Date()) { error in
            if let error = error {
                debugPrint(error)
            }
        }
    }
}