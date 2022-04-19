//
//  RECMetrics.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend. All rights reserved.
//

import Foundation

public struct RECMetrics: Encodable {
    public let nonInteractive: Bool
    public let data: [RECMetric]
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case nonInteractive = "non_interactive"
        case data
    }
    
    // MARK: Init
    
    public init(
        nonInteractive: Bool = false,
        data: [RECMetric]
    ) {
        self.nonInteractive = nonInteractive
        self.data = data
    }
    
    public init(
        nonInteractive: Bool = false,
        data: [String: String]
    ) {
        let data = data.map({ RECMetric(code: $0.key, value: $0.value) })
        self.init(nonInteractive: nonInteractive, data: data)
    }
}
