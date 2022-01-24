//
//  RECRecommendationProduct.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECRecommendationProduct: Decodable {
    typealias AdditionalAttributes = RECRecommendationAdditionalAttributes
    
    let name: String
    let trimedName: String?
    let sku: String
    let status: Bool
    let lists: [String]
    let price: Double
    let originalPrice: Double
    let image: String
    let url: String
    let attrs: AdditionalAttributes?
    
    // MARK: Coding Keys
    
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
