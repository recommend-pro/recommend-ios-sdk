//
//  RECDeviceAPIService.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceAPIService {
    private let core: RECCore
    private var apiClient: RECAPIClient {
        return core.apiClient
    }
    
    // MARK: Init
    
    init(core: RECCore) {
        self.core = core
    }
    
    // MARK: Activity Tracking
    
    func trackActivity(
        _ data: RECDeviceActivityTrackingRequest,
        completionHandler: @escaping (Error?) -> Void
    ) {
        do {
            let deviceId = try core.getDeviceId()
            let endpoint = RECAPIEndpoint(
                method: .post,
                path: "/v3/\(core.accountId)/device/\(deviceId)/activity",
                headers: [
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                ])
            
            let body = try JSONEncoder().encode(data)
            apiClient.processRequest(
                for: endpoint,
                with: body,
                completionHandler: completionHandler)
        } catch {
            completionHandler(error)
        }
    }
}
