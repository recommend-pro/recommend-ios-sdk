//
//  RECRecommendationNilStoreError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 09.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECRecommendationNilStoreError: RECRecommendationError {
    public var errorCode: Int {
        return RECRecommendationErrorCodes.nilStore.rawValue
    }
    
    public var errorDescription: String? {
        return "Store code is not provided."
    }
    
    public var failureReason: String? {
        return "Store code is not provided in environment."
    }
    
    public var recoverySuggestions: String? {
        return "Set store code to environment."
    }
}
