//
//  RECConfiguration.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UIKit

public let kRECInfoPlistName: String = "Recommend-Info"

struct RECConfiguration {
    let accountId: String
    
    // MARK: Init
    
    init(accountId: String) {
        self.accountId = accountId
    }
}

// MARK: Property List

extension RECConfiguration: Decodable {
    static func loadFromPlist() throws -> RECConfiguration {
        guard
            let url = Bundle.main.url(
                forResource: kRECInfoPlistName,
                withExtension: "plist")
        else {
            throw RECInvalidInfoPlistError(error: nil)
        }
        
        do {
            let data = try Data(contentsOf: url)
            return try PropertyListDecoder().decode(RECConfiguration.self, from: data)
        } catch {
            throw RECInvalidInfoPlistError(error: error)
        }
    }
}
