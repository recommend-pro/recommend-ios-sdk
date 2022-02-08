//
//  RECRecommendationError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 06.02.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public enum RECRecommendationError: Error {
    case nilStore
    case nilCurrency
    case nilPriceList
}
