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
    let applicationName: String?
    let apiHost: String
    
    // MARK: Init
    
    init(
        accountId: String,
        applicationName: String?,
        apiHost: String
    ) {
        self.accountId = accountId
        self.applicationName = applicationName
        self.apiHost = apiHost
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
    
    private enum CodingKeys: String, CodingKey {
        case accountId = "ACCOUNT_ID"
        case applicationName = "APP_NAME"
        case apiHost = "API_HOST"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.applicationName = try container.decodeIfPresent(String.self, forKey: .applicationName)
        self.apiHost = (try container.decodeIfPresent(String.self, forKey: .apiHost)) ?? kRECAPIDefaultHost
    }
}
