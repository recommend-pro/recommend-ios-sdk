//
//  RECActivityCustomEventData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECActivityCustomEventData: Encodable {
    public let event: String
    
    // MARK: Init
    
    public init(
        event: String
    ) {
        self.event = event
    }
}
