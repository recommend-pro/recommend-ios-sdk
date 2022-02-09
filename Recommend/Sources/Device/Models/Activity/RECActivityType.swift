//
//  RECActivityType.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 09.02.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public enum RECActivityType: String, Encodable {
    // Application
    case openApp = "open_app"
    case updateDevice = "update_device"
    
    // Wishlist
    case wishlistUpdate = "wishlist_update"
    case addToWishlist = "add_to_wishlist"
    case removeFromWishlist = "remove_from_wishlist"
    
    // Cart
    case cartUpdate = "cart_update"
    case addToCart = "add_to_cart"
    case removeFromCart = "remove_from_cart"
    
    // Page
    case pageView = "page_view"
    
    // Product
    case productView = "product_view"
    case productRated = "product_rated"
    case productClick = "product_click"
    
    // List
    case listView = "list_view"
    case elasticList = "elastic_list"
    
    // Panel
    case panelView = "panel_view"
    
    // Search
    case searchView = "search_view"
    
    // Checkout
    case checkout
    
    // Sale
    case sale
    
    // Subscribe
    case subscribe
    
    // Customer
    case login
    case logout
    case customerRegistration = "customer_registration"
    
    // Custom
    case customEvent = "custom_event"
    
    // Link
    case linkDevice = "link_device"
}
