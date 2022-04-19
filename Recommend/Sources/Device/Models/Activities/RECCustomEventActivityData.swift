//
//  RECCustomEventActivityData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECCustomEventActivity: RECDataActivity<RECCustomEventActivityData> {
    public init(
        event: String
    ) {
        let data = RECCustomEventActivityData(event: event)
        super.init(
            type: .customEvent,
            data: data)
    }
}

// MARK: - Data

public struct RECCustomEventActivityData: Encodable {
    public let event: String
}
