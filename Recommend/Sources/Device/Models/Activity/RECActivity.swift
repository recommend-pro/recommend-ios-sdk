//
//  RECActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public enum RECActivity: Encodable {
    case openApp
    
    // Wishlist
    case wishlistUpdate(_ data: RECActivityWishlistUpdateData)
    case addToWishlist(_ data: RECActivityAddToWishlistData)
    case removeFromWishlist(_ data: RECActivityAddToWishlistData)
    
    // Cart
    case cartUpdate(_ data: RECActivityCartUpdateData)
    case addToCart(_ data: RECActivityAddToCartData)
    case removeFromCart(_ data: RECActivityAddToCartData)
    
    // Product
    case productView(_ data: RECActivityProductViewData)
    case productRated(_ data: RECActivityProductRatedData)
    case productClick(_ data: RECActivityProductClickData)
    
    // Search
    case searchView(_ data: RECActivitySearchViewData)

    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case type
        case data
    }
    
    // MARK: Encodable
    
    public func encode(to encoder: Encoder) throws {
        var type: RECActivityType
        var data: Data?
        
        switch self {
        case .openApp:
            type = .openApp
            
        case .wishlistUpdate(let activityData):
            type = .wishlistUpdate
            data = try JSONEncoder().encode(activityData)
            
        case .addToWishlist(let activityData):
            type = .addToWishlist
            data = try JSONEncoder().encode(activityData)
            
        case .removeFromWishlist(let activityData):
            type = .removeFromWishlist
            data = try JSONEncoder().encode(activityData)
            
        case .cartUpdate(let activityData):
            type = .cartUpdate
            data = try JSONEncoder().encode(activityData)
            
        case .addToCart(let activityData):
            type = .addToCart
            data = try JSONEncoder().encode(activityData)
            
        case .removeFromCart(let activityData):
            type = .removeFromCart
            data = try JSONEncoder().encode(activityData)
            
        case .productView(let activityData):
            type = .productView
            data = try JSONEncoder().encode(activityData)
            
        case .productRated(let activityData):
            type = .productRated
            data = try JSONEncoder().encode(activityData)
            
        case .productClick(let activityData):
            type = .productClick
            data = try JSONEncoder().encode(activityData)
            
        case .searchView(let activityData):
            type = .productClick
            data = try JSONEncoder().encode(activityData)
        }
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(data, forKey: .data)
    }
}

// MARK: - Activity Type

private enum RECActivityType: String, Encodable {
    case openApp = "open_app"
    
    // Wishlist
    case wishlistUpdate = "wishlist_update"
    case addToWishlist = "add_to_wishlist"
    case removeFromWishlist = "remove_from_wishlist"
    
    // Cart
    case cartUpdate = "cart_update"
    case addToCart = "add_to_cart"
    case removeFromCart = "remove_from_cart"
    
    // Product
    case productView = "product_view"
    case productRated = "product_rated"
    case productClick = "product_click"
    
    // Search
    case searchView = "search_view"
}
