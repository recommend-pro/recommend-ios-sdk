//
//  RECPriceList.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECPriceList: Codable {
    public let code: String
    public let fallbackMode: FallbackMode?
    public let alternatives: [String]?
    
    // MARK: Init
    
    public init(
        code: String,
        fallbackMode: FallbackMode?,
        alternatives: [String]?
    ) {
        self.code = code
        self.fallbackMode = fallbackMode
        self.alternatives = alternatives
    }
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case code
        case fallbackMode = "fallback_mode"
        case alternatives
    }
    
    // MARK: Fallback Mode
    
    public enum FallbackMode: String, Codable {
        case none
        case `default`
        case alternative
    }
}
