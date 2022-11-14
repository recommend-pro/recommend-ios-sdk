//
//  RECDevice.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UIKit

final class RECDevice {
    private let core: RECCore
    private let apiService: RECDeviceAPIService
    
    private var customerInfo: RECCustomerInfo {
        core.customerInfo
    }
    
    // MARK: Init
    
    init(core: RECCore) {
        self.core = core
        self.apiService = RECDeviceAPIService(core: core)
        
        // Notifications
        NotificationCenter.default.addObserver(
            forName: UIKit.UIApplication.willEnterForegroundNotification,
            object: nil,
            queue: .main,
            using: handleNotification(_:))
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Notifications
    
    private func handleNotification(_ notification: Notification) {
        switch notification.name {
        case UIKit.UIApplication.willEnterForegroundNotification:
            applicationWillEnterForeground()
        default:
            break
        }
    }
    
    // MARK: Track Activity
    
    func trackActivity(
        _ activity: [RECDeviceActivity],
        completionHandler: ((Error?) -> Void)? = nil
    ) {
        let priceList = customerInfo.priceList?.code
        let eventTime: Int = Int(Date().timeIntervalSince1970)
        let data = RECDeviceActivityTrackingRequest(
            customerIdHash: customerInfo.idHash,
            store: customerInfo.store,
            currency: customerInfo.currency,
            environment: customerInfo.environment,
            priceList: priceList,
            deviceTime: .current,
            eventTime: eventTime,
            metrics: customerInfo.metrics,
            activity: activity)
        apiService.trackActivity(data) { error in
            completionHandler?(error)
        }
    }
    
    func linkDevice(ids deviceIdsToLink: [String]) {
        trackActivity([.linkDevice(deviceIdsToLink: deviceIdsToLink)])
    }
    
    private func updateDeviceActivity() -> RECDeviceActivity {
        let device = UIKit.UIDevice.current
        let locale = Locale.current
        let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        
        return  .updateDevice(
            model: device.model,
            name: device.name,
            firstLaunch: core.isFirstLaunch,
            systemVersion: device.systemVersion,
            appVersion: appVersion,
            deviceLanguage: locale.languageCode,
            deviceCountry: locale.regionCode,
            location: .default)
    }
    
    // MARK: Application
    
    func applicationDidFinishLaunching() {
        trackActivity([
            updateDeviceActivity()
        ])
    }
    
    private func applicationWillEnterForeground() {
        trackActivity([
            .openApp
        ])
    }
}
