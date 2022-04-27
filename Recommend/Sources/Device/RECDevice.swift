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
    
    // MARK: Init
    
    init(
        core: RECCore
    ) {
        self.core = core
        self.apiService = APIService(core: core)
    }
     
    // MARK: Track Device Activity
    
    public func trackDeviceActivity(
        _ deviceActivity: RECDeviceActivity,
        completion: ((Error?) -> Void)? = nil
    ) {
        apiService.trackDeviceActivity(deviceActivity) { error in
            completion?(error)
        }
    }
    
    private func trackDeviceActivity(
        eventTime: Date = Date(),
        activity: [RECActivity],
        completion: ((Error?) -> Void)? = nil
    ) {
        let deviceActivity = RECDeviceActivity(
            eventTime: Int(eventTime.timeIntervalSince1970),
            activity: activity)
        trackDeviceActivity(
            deviceActivity,
            completion: completion)
    }
    
    // MARK: Open App
    
    public func trackOpenApp() {
        let activity: RECActivity = RECOpenAppActivity()
        trackDeviceActivity(activity: [activity])
    }
    
    // MARK: Update Device
    
    public func trackUpdateDevice() {
        let firstLaunch = core.firstLaunch == nil
        let activity: RECActivity = RECUpdateDeviceActivity.default(firstLaunch: firstLaunch)
        
        trackDeviceActivity(activity: [activity])
    }
}
