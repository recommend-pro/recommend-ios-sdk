//
//  RECConfig.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UIKit

public let kRECDefaultAPIHost = "api.recommend.pro"
private let kRECURLSessionIdentifier = ""

public final class RECConfig {
    public let appName: String
    public let appId: String
    public let apiHost: String
    public let urlSession: URLSession
    private let userDefaults: RECConfigUserDefaults
    
    private var identifierForVendorUUIDString: String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
    
    public var deviceId: String? {
        if let storedDeviceId = userDefaults.deviceId, storedDeviceId != "" {
            return storedDeviceId
        } else {
            let deviceId = self.identifierForVendorUUIDString
            self.userDefaults.deviceId = deviceId
            return deviceId
        }
    }
    
    // MARK: Init
    
    init(appName: String,
         appId: String,
         apiHost: String = kRECDefaultAPIHost) {
        self.appName = appName
        self.appId = appId
        self.apiHost = apiHost
        self.urlSession = URLSession.shared
        self.userDefaults = RECConfigUserDefaults()
    }
}
