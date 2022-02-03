//
//  RECProductAttributes.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 03.02.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECProductAttributes: Decodable {
    @RECProductAttribute public private(set) var attributesByStore: String?
    @RECProductAttribute public private(set) var designer: String?
    @RECProductAttribute public private(set) var discount: String?
    @RECProductAttribute public private(set) var gender: String?
    @RECProductAttribute public private(set) var googleCategory: String?
    @RECProductAttribute public private(set) var hardRestrictionCountries: [String]?
    @RECProductAttribute public private(set) var isPreview: Bool?
    @RECProductAttribute public private(set) var isSale: Bool?
    @RECProductAttribute public private(set) var isTeen: Bool?
    @RECProductAttribute public private(set) var prices: String?
    @RECProductAttribute public private(set) var productType: String?
    @RECProductAttribute public private(set) var productTypeGrouped: String?
    @RECProductAttribute public private(set) var publishDate: Int?
    @RECProductAttribute public private(set) var quantity: Int?
    @RECProductAttribute public private(set) var restrictedCountries: [String]?
    @RECProductAttribute public private(set) var sale: String?
    @RECProductAttribute public private(set) var season: String?
    @RECProductAttribute public private(set) var smallImage: String?
    @RECProductAttribute public private(set) var softRestrictionCountries: [String]?
    @RECProductAttribute public private(set) var sustainabilityPropertyCodes: [String]?
    
    // MARK: Coding Keys

    enum CodingKeys: String, CodingKey, Codable, CaseIterable {
        case attributesByStore = "attributes_by_store"
        case designer
        case discount
        case gender
        case googleCategory = "google_category"
        case hardRestrictionCountries = "hard_restriction_countries"
        case isPreview = "is_preview"
        case isSale = "is_sale"
        case isTeen = "is_teen"
        case prices
        case productType = "product_type"
        case productTypeGrouped = "product_type_grouped"
        case publishDate = "publish_date"
        case quantity
        case restrictedCountries = "restricted_countries"
        case sale
        case season
        case smallImage = "small_image"
        case softRestrictionCountries = "soft_restriction_countries"
        case sustainabilityPropertyCodes = "sustainability_property_codes"
    }
}
