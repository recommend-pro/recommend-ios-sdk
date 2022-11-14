//
//  RECCustomerInfo.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.11.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation

public final class RECCustomerInfo {
    private let userDefaults: UserDefaults
    
    public var idHash: String? {
        didSet { userDefaults.customerIdHash = idHash }
    }
    public var emailHash: String? {
        didSet { userDefaults.customerEmailHash = emailHash }
    }
    public var store: String? {
        didSet { userDefaults.customerStore = store }
    }
    public var currency: String? {
        didSet { userDefaults.customerCurrency = currency }
    }
    public var environment: String? {
        didSet { userDefaults.customerEnvironment = environment }
    }
    public var priceList: RECPriceList? {
        didSet { userDefaults.customerPriceList = priceList }
    }
    public var metrics: RECMetrics? {
        didSet { userDefaults.customerMetrics = metrics }
    }
    
    // MARK: Init
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
        
        self.idHash = userDefaults.customerIdHash
        self.emailHash = userDefaults.customerEmailHash
        self.store = userDefaults.customerStore
        self.currency = userDefaults.customerCurrency
        self.environment = userDefaults.customerEnvironment
        self.priceList = userDefaults.customerPriceList
        self.metrics = userDefaults.customerMetrics
    }
}

// MARK: - UserDefaults

fileprivate extension UserDefaults {
    private static let customerIdHashKey = "CUSTOMER_ID_HASH"
    var customerIdHash: String? {
        get { string(forKey: Self.customerIdHashKey) }
        set { set(newValue, forKey: Self.customerIdHashKey) }
    }
    
    private static let customerEmailHashKey = "CUSTOMER_EMAIL_HASH"
    var customerEmailHash: String? {
        get { string(forKey: Self.customerEmailHashKey) }
        set { set(newValue, forKey: Self.customerEmailHashKey) }
    }
    
    private static let customerStoreKey = "CUSTOMER_STORE"
    var customerStore: String? {
        get { string(forKey: Self.customerStoreKey) }
        set { set(newValue, forKey: Self.customerStoreKey) }
    }
    
    private static let customerCurrencyKey = "CUSTOMER_CURRENCY"
    var customerCurrency: String? {
        get { string(forKey: Self.customerCurrencyKey) }
        set { set(newValue, forKey: Self.customerCurrencyKey) }
    }
    
    private static let customerEnvironmentKey = "CUSTOMER_ENVIRONMENT"
    var customerEnvironment: String? {
        get { string(forKey: Self.customerEnvironmentKey) }
        set { set(newValue, forKey: Self.customerEnvironmentKey) }
    }
    
    private static let customerPriceListKey = "CUSTOMER_PRICE_LIST"
    var customerPriceList: RECPriceList? {
        get {
            guard let data = self.data(forKey: Self.customerPriceListKey) else {
                return nil
            }
            return try? PropertyListDecoder().decode(RECPriceList.self, from: data)
        }
        set {
            guard let newValue = newValue else {
                setNilValueForKey(Self.customerPriceListKey)
                return
            }
            let data = try? PropertyListEncoder().encode(newValue)
            set(data, forKey: Self.customerPriceListKey)
        }
    }
    
    private static let customerMetricsKey = "CUSTOMER_METRICS"
    var customerMetrics: RECMetrics? {
        get {
            guard let data = self.data(forKey: Self.customerMetricsKey) else {
                return nil
            }
            return try? PropertyListDecoder().decode(RECMetrics.self, from: data)
        }
        set {
            guard let newValue = newValue else {
                setNilValueForKey(Self.customerMetricsKey)
                return
            }
            let data = try? PropertyListEncoder().encode(newValue)
            set(data, forKey: Self.customerMetricsKey)
        }
    }
}
