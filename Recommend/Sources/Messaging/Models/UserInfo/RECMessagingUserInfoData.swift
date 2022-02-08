//
//  RECMessagingUserInfoData.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECMessagingUserInfoData: Decodable {
    let openURLString: String?
    let id: String?
    let recommendPushNotification: Bool?
    
    var openURL: URL? {
        guard let urlString = openURLString else {
            return nil
        }
        return URL(string: urlString)
    }
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case openURLString = "open-url"
        case id = "_rec_mid"
        case recommendPushNotification = "recommend_push_notification"
    }
}
