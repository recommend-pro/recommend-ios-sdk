//
//  RECActivityCustomerRegistrationData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceRegistrationActivity: RECDeviceActivityWithData {
    public init(
        requestId: String? = nil,
        versionId: String? = nil
    ) {
        let data = RECDeviceRegistrationActivityData(
            requestId: requestId,
            versionId: versionId)
        super.init(
            type: "customer_registration",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func customerRegistration(
        requestId: String? = nil,
        versionId: String? = nil
    ) -> RECDeviceActivity {
        RECDeviceRegistrationActivity(
            requestId: requestId,
            versionId: versionId)
    }
}
