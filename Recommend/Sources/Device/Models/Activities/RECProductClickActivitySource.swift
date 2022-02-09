//
//  RECProductClickActivitySource.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 09.02.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public class RECProductClickActivitySource: Encodable {
    public let type: String
    
    // MARK: Init
    
    init(type: String) {
        self.type = type
    }
}

extension RECProductClickActivitySource {
    public static func panel(panelId: String) -> RECProductClickActivitySource {
        return RECProductClickActivityPanelSource(panelId: panelId)
    }
    
    public static func list(listId: String) -> RECProductClickActivitySource {
        return RECProductClickActivityListSource(listId: listId)
    }
    
    public static func search(term: RECActivitySearchTerm) -> RECProductClickActivitySource {
        return RECProductClicActivitykSearchSource(term: term)
    }
}

// MARK: - Panel Source

public final class RECProductClickActivityPanelSource: RECProductClickActivitySource {
    public let panelId: String
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case panelId = "panel_id"
    }
    
    // MARK: Init
    
    init(panelId: String) {
        self.panelId = panelId
        super.init(type: "panel")
    }
}

// MARK: - List Source

public final class RECProductClickActivityListSource: RECProductClickActivitySource {
    public let listId: String
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case listId = "list_id"
    }
    
    // MARK: Init
    
    init(listId: String) {
        self.listId = listId
        super.init(type: "list")
    }
}

// MARK: - Search Source

public final class RECProductClicActivitykSearchSource: RECProductClickActivitySource {
    public let term: RECActivitySearchTerm
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case term
    }
    
    // MARK: Init
    
    init(term: RECActivitySearchTerm) {
        self.term = term
        super.init(type: "search")
    }
}
