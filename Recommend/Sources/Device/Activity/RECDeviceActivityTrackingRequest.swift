//
//  RECDeviceActivityTrackingRequest.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECDeviceActivityTrackingRequest: Encodable {
    let customerIdHash: String?
    let store: String?
    let currency: String?
    let environment: String?
    let priceList: String?
    let deviceTime: RECDeviceTime?
    let eventTime: Int?
    let metrics: RECMetrics?
    let activity: [RECDeviceActivity]
    
    // MARK: Coding
    
    private enum CodingKeys: String, CodingKey {
        case customerIdHash = "customer_id_hash"
        case store
        case currency
        case environment
        case priceList = "price_list"
        case deviceTime = "device_time"
        case eventTime = "event_time"
        case metrics
        case activity
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(customerIdHash, forKey: .customerIdHash)
        try container.encodeIfPresent(store, forKey: .store)
        try container.encodeIfPresent(currency, forKey: .currency)
        try container.encodeIfPresent(environment, forKey: .environment)
        try container.encodeIfPresent(priceList, forKey: .priceList)
        try container.encodeIfPresent(deviceTime, forKey: .deviceTime)
        try container.encodeIfPresent(eventTime, forKey: .eventTime)
        try container.encodeIfPresent(metrics, forKey: .metrics)
        try container.encode(activity, forKey: .activity)
    }
}
