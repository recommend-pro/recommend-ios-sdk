//
//  Recommend.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UIKit.UIApplication

public final class Recommend {
    private var isConfigured: Bool = false
    private var core: RECCore!
    
    public var customerInfo: RECCustomerInfo! {
        core?.customerInfo
    }
    
    // MARK: Shared instance
    
    public static let shared = {
        Recommend()
    }()
    
    // MARK: Init
    
    private init() { }
    
    public convenience init(accountId: String) {
        self.init()
        let configuration = RECConfiguration(accountId: accountId)
        configure(with: configuration)
    }
    
    // MARK: Configure
    
    private func configure(with configuration: RECConfiguration) {
        guard isConfigured == false else {
            return
        }
        isConfigured = true
        self.core = RECCore(configuration: configuration)
    }
    
    public static func configure() {
        do {
            let configuration = try RECConfiguration.loadFromPlist()
            shared.configure(with: configuration)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    public static func configure(accountId: String) {
        let configuration = RECConfiguration(accountId: accountId)
        shared.configure(with: configuration)
    }
}
