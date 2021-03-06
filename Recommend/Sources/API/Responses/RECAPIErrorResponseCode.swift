//
//  RECAPIErrorResponseCode.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public enum RECAPIErrorResponseCode: Decodable {
    case invalidData
    case accessDenied
    case notFound
    case unknown(String)
    
    // MARK: Init
    
    init(rawValue: String) {
        switch rawValue {
        case "invalid_data":
            self = .invalidData
        case "acess_denied":
            self = .accessDenied
        case "not_found":
            self = .notFound
        default:
            self = .unknown(rawValue)
        }
    }
    
    // MARK: Decode
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self.init(rawValue: rawValue)
    }
}
