//
//  RECActivityProductClickData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECActivityProductClickData: Encodable {
    public typealias Source = RECActivityProductClickSource
    
    public let sku: String
    public let products: [RECActivityProduct]?
    public let source: Source?
    
    // MARK: Init
    
    public init(
        sku: String,
        products: [RECActivityProduct]?,
        source: Source?
    ) {
        self.sku = sku
        self.products = products
        self.source = source
    }
}

// MARK: - Product Click Source

public enum RECActivityProductClickSource: Encodable {
    fileprivate typealias PanelSource = RECActivityProductClickPanelSource
    fileprivate typealias ListSource = RECActivityProductClickListSource
    fileprivate typealias SearchSource = RECActivityProductClickSearchSource
    
    case panel(panelId: String)
    case list(listId: String)
    case search(type: RECActivitySearchTermType, value: String)
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case type
        case data
    }
    
    // MARK: Encode
    
    public func encode(to encoder: Encoder) throws {
        let type: String!
        let data: Data!
        
        switch self {
        case .panel(let panelId):
            type = "panel"
            let sourceData = PanelSource(panelId: panelId)
            data = try JSONEncoder().encode(sourceData)
            
        case .list(let listId):
            type = "list"
            let sourceData = ListSource(listId: listId)
            data = try JSONEncoder().encode(sourceData)
            
        case .search(let termType, let value):
            type = "search"
            let term = RECActivitySearchTerm(type: termType, value: value)
            let sourceData = SearchSource(term: term)
            data = try JSONEncoder().encode(sourceData)
        }
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(data, forKey: .data)
    }
}

// MARK: - Panel Source

private struct RECActivityProductClickPanelSource: Encodable {
    let panelId: String
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case panelId = "panel_id"
    }
}

// MARK: - List Source

private struct RECActivityProductClickListSource: Encodable {
    let listId: String
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case listId = "list_id"
    }
}

// MARK: - Search Source

private struct RECActivityProductClickSearchSource: Encodable {
    let term: RECActivitySearchTerm
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case term
    }
}
