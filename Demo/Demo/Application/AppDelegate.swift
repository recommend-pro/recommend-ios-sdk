//
//  AppDelegate.swift
//  Demo
//
//  Created by Dmytrii Golovanov on 23.06.2022.
//  Copyright © 2022 Recommend OÜ. All rights reserved.
//

import UIKit
import Recommend

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        Recommend.initialize(
            accountId: <#Account ID#>,
            applicationName: <#Push Integration Name#>
        )
        
        Recommend.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
        
        UIApplication.shared.registerForRemoteNotifications()
        
        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        Recommend.shared.applicationWillEnterForeground()
    }
    
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        Recommend.shared.setDeviceToken(deviceToken)
    }
    
    func application(
        _ application: UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable : Any],
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
            
        Recommend.shared.applicationDidReceiveRemoteNotification(userInfo)
        if let url = Recommend.shared.remoteNotificationOpenURL(userInfo) {
            print("Recommend URL: \(url.absoluteString)")
        }
            
        completionHandler(.newData)
    }
}

