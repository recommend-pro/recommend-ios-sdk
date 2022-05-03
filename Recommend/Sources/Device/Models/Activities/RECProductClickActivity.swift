//
//  RECProductClickActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECProductClickActivity: RECActivity {
    let data: RECProductClickActivityData
    
    // MARK: Init
    
    public typealias Source = RECProductClickSource

    // MARK: Init

    public init(
        sku: String,
        products: [RECActivityProduct]?,
        source: Source?
    ) {
        self.data = RECProductClickActivityData(
            sku: sku,
            products: products,
            source: source)
        super.init(
            type: "product_click")
    }
    
    // MARK: Encoding
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try super.encode(to: encoder)
    }
}

// MARK: - Data

struct RECProductClickActivityData: Encodable {
    let sku: String
    let products: [RECActivityProduct]?
    let source: RECProductClickSource?
}

// MARK: - Product Click Source

public enum RECProductClickSource: Encodable {
    case panel(panelId: String)
    case list(listId: String)
    case search(term: RECActivitySearchTerm)
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case type
        case data
    }
    
    // MARK: Encode
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case .panel(let panelId):
            let data = RECProductClickPanelSourceData(panelId: panelId)
            try container.encode("panel", forKey: .type)
            try container.encode(data, forKey: .data)
            
        case .list(let listId):
            let data = RECProductClickListSourceData(listId: listId)
            try container.encode("list", forKey: .type)
            try container.encode(data, forKey: .data)
            
        case .search(let term):
            let data = RECProductClickSearchSourceData(term: term)
            try container.encode("search", forKey: .type)
            try container.encode(data, forKey: .data)
        }
    }
}

// MARK: - Product Click Panel Source

private struct RECProductClickPanelSourceData: Encodable {
    let panelId: String
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case panelId = "panel_id"
    }
}

// MARK: - Product Click List Source

private struct RECProductClickListSourceData: Encodable {
    let listId: String
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case listId = "list_id"
    }
}

// MARK: - Product Click Search Source

private struct RECProductClickSearchSourceData: Encodable {
    let term: RECActivitySearchTerm
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case term
    }
}
