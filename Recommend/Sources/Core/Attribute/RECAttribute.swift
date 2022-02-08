//
//  RECAttribute.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 02.02.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public enum RECAttribute: Decodable {
    // case integer(Int)
    case string(String)
    // case date(Int)
    // case image(String)
    case float(Float)
    case boolean(Bool)
    // case integerList([Int])
    case stringList([String])
    // case dateList([Int])
    // case imageList([String])
    case floatList([Float])
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case val
    }
    
    // MARK: Init
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try? container.decode(String.self, forKey: .val) {
            self = .string(value)
            
        } else if let value = try? container.decode(Float.self, forKey: .val) {
            self = .float(value)
            
        } else if let value = try? container.decode(Bool.self, forKey: .val) {
            self = .boolean(value)
            
        } else if let value = try? container.decode([Float].self, forKey: .val) {
            self = .floatList(value)
            
        } else if let value = try? container.decode([String].self, forKey: .val) {
            self = .stringList(value)
            
        } else {
            let errorDebugDescription: String = "Unexpected type for key \(CodingKeys.val.stringValue)"
            throw DecodingError.dataCorruptedError(forKey: CodingKeys.val, in: container, debugDescription: errorDebugDescription)
        }
    }
}
