//
//  Recommend.swift
//  Recommend
//
//  Created by Dmytrii Golovanov on 07.12.2021.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import Foundation
import UIKit

public final class Recommend: NSObject {
    private let core: RECCore
    public let device: RECDevice
    public let recommendation: RECRecommendation
    
    // MARK: Init
    
    public init(appName: String,
                appId: String,
                apiHost: String = kRECDefaultAPIHost) {
        let config = RECConfig(appName: appName,
                               appId: appId,
                               apiHost: apiHost)
        self.core = RECCore(config: config)
        self.device = RECDevice(core: core)
        self.recommendation = RECRecommendation(core: core)
    }
    
    // MARK: Device ID
    
    public func deviceId() throws -> String {
        return try core.config.deviceId()
    }
    
    // MARK: Application
    
    public func application(_ application: UIApplication,
                            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        let isRemoteNotification = launchOptions?[.remoteNotification] as? [AnyHashable: Any] != nil

        if !(application.applicationState == .background && isRemoteNotification) {
            self.device.updateDevice()
            self.device.trackActivity(activity: [.openApp])
        }
    }
    
    // MARK: Device
    
    public func trackDeviceActivity(activity: [RECActivity],
                                    eventTime: Date = Date(),
                                    completion: @escaping (Error?) -> Void) {
        device.trackActivity(activity: activity,
                             eventTime: eventTime,
                             completion: completion)
    }
    
    // MARK: Recommendation
    
    public func fetchPanels(pageType: String? = nil,
                            panels: [RECRecommendationPanelsFetchModel.Panel]? = nil,
                            previewPanel: RECRecommendationPanelsFetchModel.PreviewPanel? = nil,
                            completion: @escaping (Result<[RECRecommendationPanel], Error>) -> Void) {
        recommendation.fetchPanels(pageType: pageType,
                                   panels: panels,
                                   previewPanel: previewPanel,
                                   completion: completion)
    }
}
