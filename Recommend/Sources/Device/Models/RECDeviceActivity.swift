//
//  RECDeviceActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECDeviceActivity: Encodable {
    /// Hash of identifier of customer
    @RECNullEncodable public private(set) var customerIdHash: String?
    /// Store code
    public let store: String?
    /// Currency code
    public let currency: String?
    /// Environment code
    public let environment: String?
    /// Price list code
    public let priceList: String?
    public let deviceTime: RECDeviceTime? = .current
    /// Timestamp of event in seconds
    public let eventTime: Int?
    public let metrics: RECMetrics?
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case customerIdHash = "customer_id_hash"
        case store
        case currency
        case environment
        case priceList = "price_list"
        case deviceTime = "device_time"
        case eventTime = "event_time"
        case metrics
    }
}
