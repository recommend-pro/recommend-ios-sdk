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
    
    private let apiService: APIService
    
    // MARK: Init
    
    init(
        core: RECCore
    ) {
        self.apiService = APIService(core: core)
    }
     
    // MARK: Track Device Activity
    
    private func trackDeviceActivity(
        _ deviceActivity: RECDeviceActivity,
        completion: ((Error?) -> Void)? = nil
    ) {
        apiService.trackDeviceActivity(deviceActivity) { error in
            completion?(error)
        }
    }
}
