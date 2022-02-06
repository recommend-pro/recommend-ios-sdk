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
    case date(Date)
    case image(URL)
    case float(Float)
    case bool(Bool)
    case intList([Int])
    case stringList([String])
    case dateList([Date])
    case imageList([URL])
    case floatList([Float])
    
    // MARK: Date Formatter
    
    private static var dateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate,
                                   .withDashSeparatorInDate,
                                   .withTime,
                                   .withColonSeparatorInTime]
        return formatter
    }()
    
    // MARK: Init
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let value = try? container.decode(Int.self) {
            self = .int(value)
            
        } else if let value = try? container.decode(String.self) {
            self.init(from: value)
            
        } else if let value = try? container.decode(Float.self) {
            self = .float(value)
            
        } else if let value = try? container.decode(Bool.self) {
            self = .bool(value)
            
        } else if let value = try? container.decode([Int].self) {
            self = .intList(value)
            
        } else if let value = try? container.decode([String].self) {
            self.init(from: value)
            
        } else if let value = try? container.decode([Float].self) {
            self = .floatList(value)
            
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "")
        }
    }
    
    private init(from string: String) {
        if let date = Self.dateFormatter.date(from: string) {
            self = .date(date)
        } else if let url = URL(string: string) {
            self = .image(url)
        } else {
            self = .string(string)
        }
    }
    
    private init(from stringList: [String]) {
        if let dateList = Self.dateList(from: stringList) {
            self = .dateList(dateList)
        } else if let imageList = Self.imageList(from: stringList) {
            self = .imageList(imageList)
        } else {
            self = .stringList(stringList)
        }
    }
    
    // MARK: Date List
    
    private static func dateList(from stringList: [String]) -> [Date]? {
        let dateList: [Date] = stringList.compactMap({ Self.dateFormatter.date(from: $0) })
        guard dateList.count == stringList.count else {
            return nil
        }
        return dateList
    }
    
    // MARK: Image (URL) List
    
    private static func imageList(from stringList: [String]) -> [URL]? {
        let imageList: [URL] = stringList.compactMap({ URL(string: $0) })
        guard imageList.count == stringList.count else {
            return nil
        }
        return imageList
    }
}
