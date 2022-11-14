//
//  RECActivityCustomerRegistrationData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceCustomerRegistrationActivity: RECDeviceActivityWithData {
    public init(requestId: String? = nil) {
        let data = RECDeviceCustomerRegistrationActivityData(requestId: requestId)
        super.init(
            type: "customer_registration",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func customerRegistration(requestId: String? = nil) -> RECDeviceActivity {
        RECDeviceCustomerRegistrationActivity(requestId: requestId)
    }
}
