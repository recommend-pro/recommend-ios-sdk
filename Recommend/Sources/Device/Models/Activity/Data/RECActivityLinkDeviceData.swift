//
//  RECActivityListViewData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 09.02.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECActivityLinkDeviceData: Encodable {
    public let deviceIdsToLink: [String]
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case deviceIdsToLink = "device_ids_to_link"
    }
    
    // MARK: Init
    
    public init(
        deviceIdsToLink: [String]
    ) {
        self.deviceIdsToLink = deviceIdsToLink
    }
}

