//
//  RECDeviceAddToWishlistActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceAddToWishlistActivity: RECDeviceActivityWithData {
    public init(
        wishlistHash: String,
        sku: String,
        variationSKU: String? = nil,
        requestId: String? = nil,
        versionId: String? = nil
    ) {
        let data = RECDeviceAddToWishlistActivityData(
            wishlistHash: wishlistHash,
            sku: sku,
            variationSKU: variationSKU,
            requestId: requestId,
            versionId: versionId)
        super.init(
            type: "add_to_wishlist",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func addToWishlist(
        wishlistHash: String,
        sku: String,
        variationSKU: String? = nil,
        requestId: String? = nil,
        versionId: String? = nil
    ) -> RECDeviceActivity {
        RECDeviceAddToWishlistActivity(
            wishlistHash: wishlistHash,
            sku: sku,
            variationSKU: variationSKU,
            requestId: requestId,
            versionId: versionId)
    }
}
