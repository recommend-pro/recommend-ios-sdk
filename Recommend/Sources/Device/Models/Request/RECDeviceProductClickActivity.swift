//
//  RECDeviceProductClickActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceProductClickActivity: RECDeviceActivity {
    let data: RECDeviceProductClickActivityData
    
    // MARK: Init
    
    public typealias Source = RECDeviceProductClickActivitySource

    // MARK: Init

    public init(
        sku: String,
        products: [RECDeviceActivityProduct]?,
        source: Source?
    ) {
        self.data = RECDeviceProductClickActivityData(
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

struct RECDeviceProductClickActivityData: Encodable {
    let sku: String
    let products: [RECDeviceActivityProduct]?
    let source: RECDeviceProductClickActivitySource?
}

// MARK: - Product Click Source

public enum RECDeviceProductClickActivitySource: Encodable {
    case panel(panelId: String)
    case list(listId: String)
    case search(term: RECDeviceActivitySearchTerm)
    
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
            let data = RECDeviceProductClickActivityPanelSourceData(panelId: panelId)
            try container.encode("panel", forKey: .type)
            try container.encode(data, forKey: .data)
            
        case .list(let listId):
            let data = RECDeviceProductClickActivityListSourceData(listId: listId)
            try container.encode("list", forKey: .type)
            try container.encode(data, forKey: .data)
            
        case .search(let term):
            let data = RECDeviceProductClickActivitySearchSourceData(term: term)
            try container.encode("search", forKey: .type)
            try container.encode(data, forKey: .data)
        }
    }
}

// MARK: - Product Click Panel Source

private struct RECDeviceProductClickActivityPanelSourceData: Encodable {
    let panelId: String
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case panelId = "panel_id"
    }
}

// MARK: - Product Click List Source

private struct RECDeviceProductClickActivityListSourceData: Encodable {
    let listId: String
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case listId = "list_id"
    }
}

// MARK: - Product Click Search Source

private struct RECDeviceProductClickActivitySearchSourceData: Encodable {
    let term: RECDeviceActivitySearchTerm
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case term
    }
}
