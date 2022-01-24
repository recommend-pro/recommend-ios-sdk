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
    private let device: RECDevice
    
    // MARK: Init
    
    init(appName: String,
         appId: String,
         apiHost: String = kRECDefaultAPIHost) {
        let config = RECConfig(appName: appName,
                               appId: appId,
                               apiHost: apiHost)
        self.core = RECCore(config: config)
        self.device = RECDevice(core: core)
    }
    
    // MARK: Device
    
    public func trackDeviceActivity(_ deviceActivity: RECDeviceActivity, completion: @escaping (Error?) -> Void) {
        device.trackActivity(deviceActivity, completion: completion)
    }
}
