//
//  RECActivityCheckoutData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECActivityCheckoutData: Encodable {
    public let step: String?
    public let option: String?
    
    // MARK: Init
    
    public init(
        step: String?,
        option: String?
    ) {
        self.step = step
        self.option = option
    }
}
