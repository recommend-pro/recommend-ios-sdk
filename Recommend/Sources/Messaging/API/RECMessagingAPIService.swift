//
//  RECMessagingAPIService.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECMessagingAPIService {
    private typealias APIEndpoints = RECMessagingAPIEndpoints
    
    private let core: RECCore
    private var config: RECConfig {
        return core.config
    }
    
    // MARK: Init
    
    init(core: RECCore) {
        self.core = core
    }
    
    // MARK: Update Push Notifications Subscription
    
    func updatePushNotificationsSubscription(model: RECMessagingSubscriptionUpdateModel,
                                             completion: @escaping (Error?) -> Void) {
        do {
            let deviceId = try config.deviceId()
            let endpoint = APIEndpoints.updatePushNotificationsSubscription(accountId: config.appId,
                                                                            deviceId: deviceId)
            let data = try JSONEncoder().encode(model)
            let request = RECAPIRequest(endpoint: endpoint, isQueueRequired: true)
            request.httpBody = data
            
            self.core.execute(apiRequest: request, completion: completion)
        } catch {
            completion(error)
        }
    }
}
