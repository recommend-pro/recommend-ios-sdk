//
//  RECAPIErrorResponse.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

final class RECAPIErrorResponse: Decodable {
    typealias ErrorCode = RECAPIErrorResponseCode
    
    let success: Bool
    let errorCode: ErrorCode
    let errorMessage: String
    
    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case success
        case errorCode = "error_code"
        case errorMessage = "error_message"
    }
}
