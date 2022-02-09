//
//  RECProductClickActivitySource.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 09.02.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public enum RECProductClickActivitySource: Encodable {
    private typealias PanelSourceData = RECProductClickActivityPanelSourceData
    private typealias ListSourceData = RECProductClickActivityListSourceData
    private typealias SearchSourceData = RECProductClicActivitykSearchSourceData
    
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
            let data = PanelSourceData(panelId: panelId)
            try container.encode("panel", forKey: .type)
            try container.encode(data, forKey: .data)
            
        case .list(let listId):
            let data = ListSourceData(listId: listId)
            try container.encode("list", forKey: .type)
            try container.encode(data, forKey: .data)
            
        case .search(let term):
            let data = SearchSourceData(term: term)
            try container.encode("search", forKey: .type)
            try container.encode(data, forKey: .data)
        }
    }
}

// MARK: - Panel Source

private struct RECProductClickActivityPanelSourceData: Encodable {
    let panelId: String
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case panelId = "panel_id"
    }
}

// MARK: - List Source

private struct RECProductClickActivityListSourceData: Encodable {
    let listId: String
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case listId = "list_id"
    }
}

// MARK: - Search Source

private struct RECProductClicActivitykSearchSourceData: Encodable {
    let term: RECActivitySearchTerm
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case term
    }
}
