//
//  RECEnvironment.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend. All rights reserved.
//

import Foundation

public class RECEnvironment {
    /// Hash of identifier of customer
    public var customerIdHash: String?
    /// Store code
    public var store: String?
    /// Currency code
    public var currency: String?
    /// Environment code
    public var environment: String?
    /// Price list
    public var priceList: RECPriceList?
    public var metrics: RECMetrics?
}
