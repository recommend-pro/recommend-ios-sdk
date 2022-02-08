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
    private let core: RECCore
    
    private var environment: RECEnvironment {
        return core.environment
    }
    
    // MARK: Int
    
    init(core: RECCore) {
        self.core = core
    }
}
