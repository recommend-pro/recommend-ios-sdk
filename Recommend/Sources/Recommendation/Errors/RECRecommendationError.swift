//
//  RECRecommendationError.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 09.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

let kRECRecommendationErrorDomain: String = "RECRecommendationError"

public protocol RECRecommendationError: RECError { }

// MARK: CustomNSError

extension RECRecommendationError {
    static public var errorDomain: String {
        return kRECRecommendationErrorDomain
    }
}
