//
//  RECRecommendationNilCurrencyError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 09.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECRecommendationNilCurrencyError: RECRecommendationError {
    public var errorCode: Int {
        return RECRecommendationErrorCodes.nilCurrency.rawValue
    }
    
    public var errorDescription: String? {
        return "Currency code is not provided."
    }
    
    public var failureReason: String? {
        return "Currency code is not provided in environment."
    }
    
    public var recoverySuggestions: String? {
        return "Set currency code to environment."
    }
}
