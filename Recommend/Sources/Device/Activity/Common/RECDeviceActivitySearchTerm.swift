//
//  RECDeviceActivitySearchTerm.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECDeviceActivitySearchTerm: Encodable {
    public let type: SearchTermType?
    public let value: String?
    
    // MARK: Init
    
    public init(
        type: SearchTermType?,
        value: String?
    ) {
        self.type = type
        self.value = value
    }
    
    // MARK: Coding
    
    private enum CodingKeys: String, CodingKey {
        case type
        case value
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(value, forKey: .value)
    }
    
    // MARK: TermType
    
    public enum SearchTermType: Encodable {
        case text
        case type(_ rawValue: String)
        
        // MARK: Init
        
        init(rawValue: String) {
            switch rawValue {
            case "text":
                self = .text
            default:
                self = .type(rawValue)
            }
        }
        
        // MARK: Encode
        
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
}
