//
//  RECRecommendationNilPriceListError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 09.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECRecommendationNilPriceListError: RECRecommendationError {
    public var errorCode: Int {
        return RECRecommendationErrorCodes.nilPriceList.rawValue
    }
    
    public var errorDescription: String? {
        return "Price list is not provided."
    }
    
    public var failureReason: String? {
        return "Price list is not provided in environment."
    }
    
    public var recoverySuggestions: String? {
        return "Set price list to environment."
    }
}
