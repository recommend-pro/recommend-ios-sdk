//
//  RECActivitySearchTerm.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECActivitySearchTerm: Encodable {
    public typealias TermType = RECActivitySearchTermType
    
    public let type: TermType
    public let value: String
}

// MARK: - Search Term Type

public enum RECActivitySearchTermType: Encodable {
    case text
    case type(_ rawValue: String)
    
    init(rawValue: String) {
        switch rawValue {
        case "text":
            self = .text
        default:
            self = .type(rawValue)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        
        let type: String!
        
        switch self {
        case .text:
            type = "text"
        case .type(let rawValue):
            type = rawValue
        }
        
        var container = encoder.singleValueContainer()
        try container.encode(type)
    }
}
