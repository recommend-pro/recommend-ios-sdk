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
    
    public let type: FilterType?
    public let code: String
    public let `operator`: Operator
    public let value: String
    
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
        value: String
    ) {
        self.type = type
        self.code = code
        self.operator = `operator`
        self.value = value
    }
}
