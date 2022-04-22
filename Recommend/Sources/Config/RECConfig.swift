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

public struct RECConfig: Decodable {
    
    public let accountId: String
    public let applicationName: String?
    public let apiHost: String
    
    // MARK: Init
    
    init(
        accountId: String,
        applicationName: String? = nil,
        apiHost: String = kRECDefaultAPIHost
    ) {
        self.accountId = accountId
        self.applicationName = applicationName
        self.apiHost = apiHost
    }
    
    init(
        fromPlist fileName: String
    ) throws {
        guard
            let url = Bundle.main.url(
                forResource: fileName,
                withExtension: "plist")
        else {
            fatalError()
        }
        do {
            let data = try Data(contentsOf: url)
            self = try PropertyListDecoder().decode(
                RECConfig.self,
                from: data)
        } catch {
            throw error
        }
    }
    
    // MARK: - Decodable
    
    enum CodingKeys: String, CodingKey {
        case accountId = "ACCOUNT_ID"
        case applicationName = "APPLICATION_NAME"
        case apiHost = "API_HOST"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.accountId = try container.decode(
            String.self,
            forKey: .accountId)
        self.applicationName = try container.decodeIfPresent(
            String.self,
            forKey: .applicationName)
        self.apiHost = try container.decodeIfPresent(
            String.self,
            forKey: .apiHost) ?? kRECDefaultAPIHost
    }
}
