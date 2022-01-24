//
//  RECDevice.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDevice {
    private let core: RECCore
    private let apiService: RECDeviceAPIService
    
    // MARK: Int
    
    init(core: RECCore) {
        self.core = core
        self.apiService = RECDeviceAPIService(core: core)
    }
    
    // MARK: Track Device Activity
    
    func trackActivity(_ deviceActivity: RECDeviceActivity, completion: @escaping (Error?) -> Void) {
        apiService.trackDeviceActivity(deviceActivity, completion: completion)
    }
}
