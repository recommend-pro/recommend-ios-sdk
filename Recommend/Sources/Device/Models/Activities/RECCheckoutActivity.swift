//
//  RECCheckoutActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECCheckoutActivity: RECDataActivity<RECCheckoutActivityData> {
    public init(
        step: String?,
        option: String?
    ) {
        let data = RECCheckoutActivityData(
            step: step,
            option: option)
        super.init(
            type: "checkout",
            data: data)
    }
}

// MARK: - Data

public struct RECCheckoutActivityData: Encodable {
    public let step: String?
    public let option: String?
}
