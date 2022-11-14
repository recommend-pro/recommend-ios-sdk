//
//  RECMessagingAPIService.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECMessagingAPIService {
    private let core: RECCore
    private var apiClient: RECAPIClient {
        return core.apiClient
    }
    
    // MARK: Init
    
    init(core: RECCore) {
        self.core = core
    }
    
    // MARK: Update Push Subscription
    
    func trackPushSubscriptionUpdate(
        request: RECMessagingPushSubscriptionTrackRequest,
        completionHandler: @escaping (Error?) -> Void
    ) {
        do {
            let deviceId = try core.getDeviceId()
            let endpoint = RECAPIEndpoint(
                method: .post,
                path: "/v3/\(core.accountId)/messaging/channel/push/ios/subscription/\(deviceId)",
                headers: [
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                ])
            
            let body = try JSONEncoder().encode(request)
            apiClient.processRequest(
                for: endpoint,
                with: body,
                completionHandler: completionHandler)
        } catch {
            completionHandler(error)
        }
    }
    
    // MARK: Track Push Event
    
    func trackPushEvent(
        _ event: RECMessagingPushEvent,
        completionHandler: @escaping (Error?) -> Void
    ) {
        do {
            let body = try JSONEncoder().encode(event.data)
            let endpoint = RECAPIEndpoint(
                method: .post,
                path: "/v3/\(core.accountId)/messaging/channel/push/\(event.id)/event",
                headers: [
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                ])
            
            apiClient.processRequest(
                for: endpoint,
                with: body,
                completionHandler: completionHandler)
        } catch {
            completionHandler(error)
        }
    }
}
