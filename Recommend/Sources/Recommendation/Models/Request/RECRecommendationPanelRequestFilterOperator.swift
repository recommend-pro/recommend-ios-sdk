//
//  RECRecommendationPanelRequestFilterOperator.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.02.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public enum RECRecommendationPanelRequestFilterOperator: String, Encodable {
    case eq
    case `in`
    case ne
    case nin
    case range
}
