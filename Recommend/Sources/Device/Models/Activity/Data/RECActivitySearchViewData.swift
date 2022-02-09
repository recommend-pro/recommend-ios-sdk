//
//  RECActivitySearchViewData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECActivitySearchViewData: Encodable {
    public let products: [RECActivityProduct]?
    public let term: RECActivitySearchTerm
    
    
    // MARK: Init
    
    public init(
        products: [RECActivityProduct]?,
        term: RECActivitySearchTerm
    ) {
        self.products = products
        self.term = term
    }
}

