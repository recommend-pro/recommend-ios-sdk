//
//  RECAPIDataResponse.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECAPIDataResponse<T>: RECAPIBaseResponse where T: Decodable {
    let result: T
    
    // MARK: Coding
    
    private enum CodingKeys: String, CodingKey {
        case result
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.result = try container.decode(T.self, forKey: .result)
        try super.init(from: decoder)
    }
}
