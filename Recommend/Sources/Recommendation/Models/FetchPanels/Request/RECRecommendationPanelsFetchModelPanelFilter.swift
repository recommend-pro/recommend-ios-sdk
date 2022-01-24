//
//  RECRecommendationPanelsFetchModelPanelFilter.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECRecommendationPanelsFetchModelPanelFilter: Encodable {
    let type: FilterType?
    let code: String
    let `operator`: Operator
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case type
        case code
        case `operator`
        case value
    }
    
    // MARK: Filter Type
    
    enum FilterType: String, Encodable {
        case product
    }
    
    // MARK: Operator
    
    enum Operator: String, Encodable {
        case eq
        case `in`
        case ne
        case nin
        case range
    }
}
