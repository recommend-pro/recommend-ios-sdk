//
//  RECHTTPMethod.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 06.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

enum RECHTTPMethod: String {
    case `get` = "GET"
    case head = "HEAD"
    case post = "POST"
    case put = "put"
    case delete = "DELETE"
    case connect = "CONNECT"
    case options = "OPTIONS"
    case trace = "TRACE"
    case patch = "PATCH"
}
