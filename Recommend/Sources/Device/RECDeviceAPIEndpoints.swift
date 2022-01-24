//
//  RECDeviceAPIEndpoints.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECDeviceAPIEndpoints {
    static func deviceActivity(config: RECConfig) -> RECAPIEndpoint {
        let path = "/v3/\(config.appId)/device/\(config.deviceId)/activity"
        return RECAPIEndpoint(path: path,
                              httpMethod: "POST")
    }
}
