//
//  RECDeviceWishlistUpdateActivity.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECDeviceWishlistUpdateActivity: RECDeviceActivityWithData {
    public init(
        wishlistHash: String,
        requestId: String? = nil,
        versionId: String? = nil
    ) {
        let data = RECDeviceWishlistUpdateActivityData(
            wishlistHash: wishlistHash,
            requestId: requestId,
            versionId: versionId)
        super.init(
            type: "wishlist_update",
            data: data)
    }
}

extension RECDeviceActivity {
    public static func wishlistUpdate(
        wishlistHash: String,
        requestId: String? = nil,
        versionId: String? = nil
    ) -> RECDeviceActivity {
        RECDeviceWishlistUpdateActivity(
            wishlistHash: wishlistHash,
            requestId: requestId,
            versionId: versionId)
    }
}
