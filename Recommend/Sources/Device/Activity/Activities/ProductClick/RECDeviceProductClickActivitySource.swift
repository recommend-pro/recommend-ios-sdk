//
//  RECDeviceProductClickSource.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public enum RECDeviceProductClickActivitySource: Encodable {
    case panel(panelId: String)
    case list(listId: String)
    case search(term: RECDeviceActivitySearchTerm)
    case custom(typeId: String)
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case type
        case data
    }
    
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
            
        case .custom(let typeId):
            let data = RECDeviceProductClickActivityCustomSourceData(typeId: typeId)
            try container.encode("custom", forKey: .type)
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
// MARK: - Product Click Custom Source

private struct RECDeviceProductClickActivityCustomSourceData: Encodable {
    let typeId: String
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case typeId = "type_id"
    }
}
