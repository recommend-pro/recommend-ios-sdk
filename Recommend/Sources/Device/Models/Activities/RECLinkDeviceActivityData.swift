//
//  RECActivityListViewData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 09.02.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECLinkDeviceActivity: RECDataActivity<RECLinkDeviceActivityData> {
    public init(
        deviceIdsToLink: [String]
    ) {
        let data = RECLinkDeviceActivityData(deviceIdsToLink: deviceIdsToLink)
        super.init(
            type: .linkDevice,
            data: data)
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

