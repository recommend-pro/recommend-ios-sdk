//
//  RECDeviceAPIEndpoints.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECDeviceAPIEndpoints {
    static func trackDeviceActivity(
        accountId: String,
        deviceId: String
    ) -> RECAPIEndpoint {
        let path = "/v3/\(accountId)/device/\(deviceId)/activity"
        let headers: [String: String] = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        return RECAPIEndpoint(path: path,
                              httpMethod: "POST",
                              headers: headers)
    }
}
