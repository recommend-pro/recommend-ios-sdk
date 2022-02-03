//
//  RECProductAttribute.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 03.02.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

@propertyWrapper
public struct RECProductAttribute<T>: Decodable where T: Decodable {
    
    public var wrappedValue: T?
    
    public init(wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }
    
    public mutating func decode(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.wrappedValue = try container.decode(T.self, forKey: .wrappedValue)
    }
        
    // MARK: Coding Keys
        
    enum CodingKeys: String, CodingKey {
        case wrappedValue = "val"
    }
}
