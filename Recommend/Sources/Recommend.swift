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
    private var device: RECDevice!
    
    public var customerInfo: RECCustomerInfo! {
        core?.customerInfo
    }
    
    // MARK: Shared instance
    
    public static let shared = {
        Recommend()
    }()
    
    // MARK: Init
    
    private init() { }
    
    public convenience init(
        accountId: String,
        apiHost: String = kRECAPIDefaultHost
    ) {
        self.init()
        let configuration = RECConfiguration(
            accountId: accountId,
            apiHost: apiHost)
        configure(with: configuration)
    }
    
    // MARK: Configure
    
    private func configure(with configuration: RECConfiguration) {
        guard isConfigured == false else {
            return
        }
        isConfigured = true
        self.core = RECCore(configuration: configuration)
        self.device = RECDevice(core: core)
    }
    
    public static func configure() {
        do {
            let configuration = try RECConfiguration.loadFromPlist()
            shared.configure(with: configuration)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    public static func configure(
        accountId: String,
        apiHost: String = kRECAPIDefaultHost
    ) {
        let configuration = RECConfiguration(
            accountId: accountId,
            apiHost: apiHost)
        shared.configure(with: configuration)
    }
    
    // MARK: Device
    
    public func trackDeviceActivity(
        _ activity: [RECDeviceActivity],
        completionHandler: ((Error?) -> Void)? = nil
    ) {
        device.trackActivity(
            activity,
            completionHandler: completionHandler)
    }
    
    public func linkDevice(ids deviceIdsToLink: [String]) {
        device.linkDevice(ids: deviceIdsToLink)
    }
    
    // MARK: Application
    
    public func application(
        _ application: UIKit.UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIKit.UIApplication.LaunchOptionsKey: Any]?
    ) {
        let isRemoteNotification = launchOptions?[.remoteNotification] as? [AnyHashable: Any] != nil
        
        if !(application.applicationState == .background && isRemoteNotification) {
            device?.applicationDidFinishLaunching()
        }
    }
}
