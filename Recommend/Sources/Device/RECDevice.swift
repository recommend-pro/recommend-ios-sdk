//
//  RECDevice.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UIKit

public final class RECDevice {
    private typealias APIService = RECDeviceAPIService
    
    private let core: RECCore
    private let apiService: APIService
    
    private var environment: RECEnvironment {
        return core.environment
    }
    
    // MARK: Int
    
    init(core: RECCore) {
        self.core = core
        self.apiService = APIService(core: core)
    }
}
