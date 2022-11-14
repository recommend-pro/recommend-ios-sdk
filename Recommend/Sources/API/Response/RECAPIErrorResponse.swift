//
//  RECAPIErrorResponse.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECAPIErrorResponse: RECAPIBaseResponse {
    let errorCode: RECAPIErrorResponseCode
    let errorMessage: String
    
    // MARK: Coding
    
    private enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case errorMessage = "error_message"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.errorCode = try container.decode(RECAPIErrorResponseCode.self, forKey: .errorCode)
        self.errorMessage = try container.decode(String.self, forKey: .errorMessage)
        try super.init(from: decoder)
    }
}
