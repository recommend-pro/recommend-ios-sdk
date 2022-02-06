//
//  RECAttribute.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 02.02.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public enum RECAttribute: Decodable {
    case int(Int)
    case string(String)
//    case date(Date)
//    case image(URL)
    case float(Float)
    case bool(Bool)
    case intList([Int])
    case stringList([String])
//    case dateList([Date])
//    case imageList([URL])
    case floatList([Float])
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let value = try? container.decode(Int.self) {
            self = .int(value)
        } else if let value = try? container.decode(String.self) {
            self = .string(value)
//        } else if let value = try? container.decode(Date.self) {
//            self = .date(value)
//        } else if let value = try? container.decode(URL.self) {
//            self = .image(value)
        } else if let value = try? container.decode(Float.self) {
            self = .float(value)
        } else if let value = try? container.decode(Bool.self) {
            self = .bool(value)
        } else if let value = try? container.decode([Int].self) {
            self = .intList(value)
        } else if let value = try? container.decode([String].self) {
            self = .stringList(value)
//        } else if let value = try? container.decode([Date].self) {
//            self = .dateList(value)
//        } else if let value = try? container.decode([URL].self) {
//            self = .imageList(value)
        } else if let value = try? container.decode([Float].self) {
            self = .floatList(value)
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "")
        }
    }
}
