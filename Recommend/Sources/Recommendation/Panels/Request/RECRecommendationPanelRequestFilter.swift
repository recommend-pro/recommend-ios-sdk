//
//  RECRecommendationPanelRequestFilter.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECRecommendationPanelRequestFilter: Encodable {
    public typealias FilterType = RECRecommendationPanelRequestFilterType
    public typealias Operator = RECRecommendationPanelRequestFilterOperator
    public typealias Value = RECRecommendationPanelRequestFilterValue
    
    public let type: FilterType?
    public let code: String
    public let `operator`: Operator
    public let value: Value
    
    enum CodingKeys: String, CodingKey {
        case type
        case code
        case `operator`
        case value
    }
    
    // MARK: Init
    
    public init(
        type: FilterType?,
        code: String,
        `operator`: Operator,
        value: Value
    ) {
        self.type = type
        self.code = code
        self.operator = `operator`
        self.value = value
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encode(code, forKey: .code)
        try container.encode(`operator`, forKey: .operator)
        try container.encode(value, forKey: .value)
    }
}
