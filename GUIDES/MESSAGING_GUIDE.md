# Recommend Messaging

## Push Notications

### Setup

1. Setup AppDelegate
2. Setup UNUserNotificationCenterDelegate
3. Request authorization
4. Subscribe or unsubscribe depending on the user's choice

AppDelegate:
```swift
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        ...
        
        UIApplication.shared.registerForRemoteNotifications()
        return true
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
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
    ) {
        Recommend.shared.applicationDidReceiveRemoteNotification(userInfo)
        if let url = Recommend.shared.remoteNotificationOpenURL(userInfo) {
            // handle url
        }
        
        ...
    }
```

*UNUserNotificationCenterDelegate* (AppDelegate is example):
```swift
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        Recommend.shared.userNotificationCenter(
            center,
            didReceive: response)
        
        let userInfo = response.notification.request.content.userInfo
        
        if let url = Recommend.shared.remoteNotificationOpenURL(userInfo) {
            // handle url
        }
        
        ...
    }
}
```

User subscription choice handling example:
```swift
func subscriptionSwitchValueChanged(_ sender: UISwitch) {
    if sender.isOn {
        Recommend.shared.subscribeToPushNotifications()
    } else {
        Recommend.shared.unsubscribeFromPushNotifications()
    }
}
```
