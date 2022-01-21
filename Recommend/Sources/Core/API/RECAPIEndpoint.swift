//
//  RECAPIEndpoint.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public struct RECAPIEndpoint {
    public let path: String
    public let httpMethod: String
    
    // MARK: Init
    
    public init(path: String,
                httpMethod: String) {
        self.path = path
        self.httpMethod = httpMethod
    }
}
