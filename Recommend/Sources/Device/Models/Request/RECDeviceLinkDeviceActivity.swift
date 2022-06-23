//
//  RECActivityListViewData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 09.02.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceLinkDeviceActivity: RECDeviceActivity {
    let data: RECDeviceLinkDeviceActivityData
    
    // MARK: Init
    
    init(
        deviceIdsToLink: [String]
    ) {
        self.data = RECDeviceLinkDeviceActivityData(deviceIdsToLink: deviceIdsToLink)
        super.init(
            type: "link_device")
    }
    
    // MARK: Encoding
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try super.encode(to: encoder)
    }
}

// MARK: - Data

struct RECDeviceLinkDeviceActivityData: Encodable {
    let deviceIdsToLink: [String]
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case deviceIdsToLink = "device_ids_to_link"
    }
}

