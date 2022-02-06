//
//  RECRecommendationPanelsFetchModelPanelFilter.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECRecommendationPanelsFetchModelPanelFilter: Encodable {
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
    
    // MARK: Filter Type
    
    public enum FilterType: String, Encodable {
        case product
    }
    
    // MARK: Operator
    
    public enum Operator: String, Encodable {
        case eq
        case `in`
        case ne
        case nin
        case range
    }
}
