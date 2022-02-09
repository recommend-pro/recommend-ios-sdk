//
//  RECActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public enum RECActivity: Encodable {
    // Application
    case openApp
    case updateDevice(_ data: RECActivityUpdateDeviceData)
    
    // Wishlist
    case wishlistUpdate(_ data: RECActivityWishlistUpdateData)
    case addToWishlist(_ data: RECActivityAddToWishlistData)
    case removeFromWishlist(_ data: RECActivityRemoveFromWishlistData)
    
    // Cart
    case cartUpdate(_ data: RECActivityCartUpdateData)
    case addToCart(_ data: RECActivityAddToCartData)
    case removeFromCart(_ data: RECActivityRemoveFromCartData)
    
    // Page
    case pageView(_ data: RECActivityPageViewData)
    
    // Product
    case productView(_ data: RECActivityProductViewData)
    case productRated(_ data: RECActivityProductRatedData)
    case productClick(_ data: RECActivityProductClickData)
    
    // List
    case listView(_ data: RECActivityListViewData)
    case elasticList(_ data: RECActivityElasticListData)
    
    case panelView(_ data: RECActivityPanelViewData)
    
    // Search
    case searchView(_ data: RECActivitySearchViewData)
    
    // Checkout
    case checkout(_ data: RECActivityCheckoutData)
    
    // Sale
    case sale(_ data: RECActivitySaleData)
    
    // Subscribe
    case subscribe(_ data: RECActivitySubscribeData)
    
    // Customer
    case login
    case logout
    case customerRegistration(_ data: RECActivityCustomerRegistationData)
    
    // Custom
    case customEvent(_ data: RECActivityCustomEventData)
    
    // Link
    case linkDevice(_ data: RECActivityLinkDeviceData)
    
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
            
        case .updateDevice(let activityData):
            type = .updateDevice
            data = try JSONEncoder().encode(activityData)
            
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
            
        case .pageView(let activityData):
            type = .pageView
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
            
        case .listView(let activityData):
            type = .listView
            data = try JSONEncoder().encode(activityData)
            
        case .elasticList(let activityData):
            type = .elasticList
            data = try JSONEncoder().encode(activityData)
            
        case .panelView(let activityData):
            type = .panelView
            data = try JSONEncoder().encode(activityData)
            
        case .searchView(let activityData):
            type = .productClick
            data = try JSONEncoder().encode(activityData)
            
        case .checkout(let activityData):
            type = .checkout
            data = try JSONEncoder().encode(activityData)
            
        case .sale(let activityData):
            type = .sale
            data = try JSONEncoder().encode(activityData)
            
        case .subscribe(let activityData):
            type = .subscribe
            data = try JSONEncoder().encode(activityData)
            
        case .login:
            type = .login
            
        case .logout:
            type = .logout
            
        case .customerRegistration(let activityData):
            type = .customerRegistration
            data = try JSONEncoder().encode(activityData)
            
        case .customEvent(let activityData):
            type = .customEvent
            data = try JSONEncoder().encode(activityData)
            
        case .linkDevice(let activityData):
            type = .linkDevice
            data = try JSONEncoder().encode(activityData)
        }
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(data, forKey: .data)
    }
}

// MARK: - Activity Type

private enum RECActivityType: String, Encodable {
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
