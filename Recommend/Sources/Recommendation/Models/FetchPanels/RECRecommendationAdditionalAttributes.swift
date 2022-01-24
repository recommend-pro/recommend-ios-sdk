//
//  RECRecommendationAdditionalAttributes.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECRecommendationAdditionalAttributes: Decodable {
    let quantity: Attribute<Int>?
    let productTypeGrouped: Attribute<String>?
    let isSale: Attribute<Bool>
    let sale: Attribute<String>?
    let isTeen: Attribute<String>?
    let season: Attribute<String>?
    let isPreview: Attribute<Bool>?
    let designer: Attribute<String>
    let productType: Attribute<String>?
    let smallImage: Attribute<String>?
    let gender: Attribute<String>?
    let googleCategory: Attribute<String>?

    enum CodingKeys: String, CodingKey, Codable, CaseIterable {
        case quantity
        case productTypeGrouped = "product_type_grouped"
        case isSale = "is_sale"
        case sale
        case isTeen = "is_teen"
        case season
        case isPreview = "is_preview"
        case designer
        case productType = "product_type"
        case smallImage = "small_image"
        case gender
        case googleCategory = "google_category"
    }
    
    struct Attribute<T: Decodable>: Decodable {
        let val: T
    }
}
