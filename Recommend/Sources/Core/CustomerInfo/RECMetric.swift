//
//  RECMetric.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend. All rights reserved.
//

import Foundation

public struct RECMetric: Codable {
    public let code: String
    public let value: String
    
    // MARK: Init
    
    public init(
        code: String,
        value: String
    ) {
        self.code = code
        self.value = value
    }
}
