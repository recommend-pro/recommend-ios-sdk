//
//  RECCustomEventActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECCustomEventActivity: RECActivity {
    public typealias ActivityData = RECCustomEventActivityData
    
    public let data: ActivityData
    
    // MARK: Init
    
    public init(
        event: String
    ) {
        self.data = ActivityData(event: event)
        super.init(type: .customEvent)
    }
}

// MARK: - Data

public struct RECCustomEventActivityData: Encodable {
    public let event: String
}
