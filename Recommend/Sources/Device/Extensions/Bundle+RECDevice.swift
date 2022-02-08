//
//  Bundle+RECDevice.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

extension Bundle {
    var bundleShortVersionString: String? {
        return object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}
