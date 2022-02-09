//
//  RECCheckoutActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECCheckoutActivity: RECActivity {
    public typealias ActivityData = RECCheckoutActivityData
    
    public let data: ActivityData
    
    // MARK: Init
    
    public init(
        step: String?,
        option: String?
    ) {
        self.data = ActivityData(step: step,
                                 option: option)
        super.init(type: .checkout)
    }
}

// MARK: - Data

public struct RECCheckoutActivityData: Encodable {
    public let step: String?
    public let option: String?
}
