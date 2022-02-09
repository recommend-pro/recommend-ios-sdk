//
//  RECActivityListViewData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 09.02.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECLinkDeviceActivity: RECActivity {
    public typealias ActivityData = RECLinkDeviceActivityData
    
    public let data: ActivityData
    
    // MARK: Init
    
    public init(
        deviceIdsToLink: [String]
    ) {
        self.data = ActivityData(deviceIdsToLink: deviceIdsToLink)
        super.init(type: .linkDevice)
    }
}

// MARK: - Data

public struct RECLinkDeviceActivityData: Encodable {
    public let deviceIdsToLink: [String]
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case deviceIdsToLink = "device_ids_to_link"
    }
}

