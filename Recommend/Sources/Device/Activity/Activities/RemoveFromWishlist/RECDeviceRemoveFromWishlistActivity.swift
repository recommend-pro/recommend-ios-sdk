//
//  RECDeviceRemoveFromWishlistActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceRemoveFromWishlistActivity: RECDeviceActivityWithData {
    public init(
        wishlistHash: String,
        sku: String,
        variationSKU: String? = nil,
        requestId: String? = nil
    ) {
        let data = RECDeviceRemoveFromWishlistActivityData(
            wishlistHash: wishlistHash,
            sku: sku,
            variationSKU: variationSKU,
            requestId: requestId)
        super.init(
            type: "remove_from_wishlist",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func removeFromWishlist(
        wishlistHash: String,
        sku: String,
        variationSKU: String? = nil,
        requestId: String? = nil
    ) -> RECDeviceActivity {
        RECDeviceRemoveFromWishlistActivity(
            wishlistHash: wishlistHash,
            sku: sku,
            variationSKU: variationSKU,
            requestId: requestId)
    }
}
