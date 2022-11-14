//
//  RECDeviceLinkDeviceActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECDeviceLinkDeviceActivityData: RECDeviceActivityData {
    let deviceIdsToLink: [String]
    
    // MARK: Init
    
    init(deviceIdsToLink: [String]) {
        self.deviceIdsToLink = deviceIdsToLink
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case deviceIdsToLink = "device_ids_to_link"
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(deviceIdsToLink, forKey: .deviceIdsToLink)
        try super.encode(to: encoder)
    }
}
