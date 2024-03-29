//
//
//  RECRecommendationPanelRequestFilterValue.swift
//  Recommend
//
//  Created by Evgeniy Pinchuk on 27.07.2023.
//  Copyright © 2023 Recommend OÜ. All rights reserved.
//


import Foundation

public enum RECRecommendationPanelRequestFilterValue : Codable {
    case null
    case number(NSNumber)
    case string(String)
    case array([RECRecommendationPanelRequestFilterValue])
    case dictionary([String : RECRecommendationPanelRequestFilterValue])
    
    public var value: Any? {
        switch self {
        case .null: return nil
        case .number(let number): return number
        case .string(let string): return string
        case .array(let array): return array.map { $0.value }
        case .dictionary(let dictionary): return dictionary.mapValues { $0.value }
        }
    }
    
    public init?(_ value: Any?) {
        guard let value = value else {
            self = .null
            return
        }
        
        if let int = value as? Int {
            self = .number(NSNumber(value: int))
        } else if let double = value as? Double {
            self = .number(NSNumber(value: double))
        } else if let string = value as? String {
            self = .string(string)
        } else if let array = value as? [Any] {
            var mapped = [RECRecommendationPanelRequestFilterValue]()
            for inner in array {
                guard let inner = RECRecommendationPanelRequestFilterValue(inner) else {
                    return nil
                }
                
                mapped.append(inner)
            }
            
            self = .array(mapped)
        } else if let dictionary = value as? [String : Any] {
            var mapped = [String : RECRecommendationPanelRequestFilterValue]()
            for (key, inner) in dictionary {
                guard let inner = RECRecommendationPanelRequestFilterValue(inner) else {
                    return nil
                }
                
                mapped[key] = inner
            }
            
            self = .dictionary(mapped)
        } else {
            return nil
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        guard !container.decodeNil() else {
            self = .null
            return
        }
        
        if let int = try container.decodeIfMatched(Int.self) {
            self = .number(NSNumber(value: int))
        } else if let double = try container.decodeIfMatched(Double.self) {
            self = .number(NSNumber(value: double))
        } else if let string = try container.decodeIfMatched(String.self) {
            self = .string(string)
        } else if let array = try container.decodeIfMatched([RECRecommendationPanelRequestFilterValue].self) {
            self = .array(array)
        } else if let dictionary = try container.decodeIfMatched([String : RECRecommendationPanelRequestFilterValue].self) {
            self = .dictionary(dictionary)
        } else {
            throw DecodingError.typeMismatch(RECRecommendationPanelRequestFilterValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Unable to decode JSON as any of the possible types."))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .null: try container.encodeNil()
        case .number(let number):
            if number.objCType.pointee == 0x64 /* 'd' */ {
                try container.encode(number.doubleValue)
            } else {
                try container.encode(number.intValue)
            }
        case .string(let string): try container.encode(string)
        case .array(let array): try container.encode(array)
        case .dictionary(let dictionary): try container.encode(dictionary)
        }
    }
}

fileprivate extension SingleValueDecodingContainer {
    func decodeIfMatched<T : Decodable>(_ type: T.Type) throws -> T? {
        do {
            return try self.decode(T.self)
        } catch DecodingError.typeMismatch {
            return nil
        }
    }
}
