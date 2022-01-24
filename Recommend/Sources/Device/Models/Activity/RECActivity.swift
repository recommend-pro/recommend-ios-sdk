//
//  RECActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//


import Foundation

public enum RECActivity: Encodable {

    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case type
        case data
    }
    
    // MARK: Encodable
    
    public func encode(to encoder: Encoder) throws {
        let type: String!
        var data: Data?
        
        //switch self {
        //
        //}
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(data, forKey: .data)
    }
}
