//
//  RECDeviceAPIService.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceAPIService {
    private typealias APIEndpoints = RECDeviceAPIEndpoints
    
    private let core: RECCore
    private var apiClient: RECAPIClient {
        return core.apiClient
    }
    private var config: RECConfig {
        return core.config
    }
    
    // MARK: Init
    
    init(core: RECCore) {
        self.core = core
    }
    
    // MARK: Track Device Activity
    
    func trackDeviceActivity(
        _ deviceActivity: RECDeviceActivity,
        completion: @escaping (Error?) -> Void
    ) {
        do {
            let deviceId = try core.getDeviceId()
            let endpoint = APIEndpoints.trackDeviceActivity(
                accountId: config.accountId,
                deviceId: deviceId)
            let data = try JSONEncoder().encode(deviceActivity)
            
            apiClient.executeRequest(
                with: endpoint,
                httpBody: data,
                attemptsLimit: 1,
                completion: completion)
        } catch {
            completion(error)
        }
    }
}
