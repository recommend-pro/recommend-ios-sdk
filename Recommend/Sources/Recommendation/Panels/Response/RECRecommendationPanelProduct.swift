//
//  RECRecommendationPanelProduct.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECRecommendationPanelProduct: Decodable {
    public let name: String
    public let trimedName: String?
    public let sku: String
    public let status: Bool
    public let lists: [String]
    public let price: Double
    public let originalPrice: Double
    public let image: String
    public let url: String
    public let attrs: [String: RECAttribute]?
    
    // MARK: Coding
    
    enum CodingKeys: String, CodingKey {
        case name
        case trimedName = "trimed_name"
        case sku
        case status
        case lists
        case price
        case originalPrice = "original_price"
        case image
        case url
        case attrs
    }
}
