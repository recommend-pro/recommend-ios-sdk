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
            
        case .removeFromWishlist(let activityData)
            type = .removeFromWishlist
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
}
