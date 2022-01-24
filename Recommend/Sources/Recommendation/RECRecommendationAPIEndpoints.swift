//
//  RECRecommendationAPIEndpoints.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 08.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

struct RECRecommendationAPIEndpoints {
    static func fetchRecommendationPanels(accountId: String) -> RECAPIEndpoint {
        let path = "/v3/\(accountId)/recommendation/panel"
        return RECAPIEndpoint(path: path,
                              httpMethod: "POST")
    }
}
