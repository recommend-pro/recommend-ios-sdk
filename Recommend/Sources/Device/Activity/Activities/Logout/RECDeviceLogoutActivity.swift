//
//  RECDeviceLogoutActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 09.02.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceLogoutActivity: RECDeviceActivity {
    public init() {
        super.init(type: "logout")
    }
}

extension RECDeviceActivity {
    public static var logout: RECDeviceActivity {
        RECDeviceLogoutActivity()
    }
}
