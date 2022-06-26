# Recommend Messaging

## Push Notications

### Subscription status

**User Subscription** - is user subscribed for notifications receiving.

**[UNAuthorizationStatus](https://developer.apple.com/documentation/usernotifications/unauthorizationstatus)** | **User Subscribed** | **Subscription**
--- | --- | --- 
[`notDetermined`](https://developer.apple.com/documentation/usernotifications/unauthorizationstatus/notdetermined) |   | ![non subscribed](https://img.shields.io/badge/-non%20subscribed-yellow)
|   | `nil` | ![non subscribed](https://img.shields.io/badge/-non%20subscribed-yellow)
[`authorized`](), [`provisional`](https://developer.apple.com/documentation/usernotifications/unauthorizationstatus/provisional), [`ephemeral`](https://developer.apple.com/documentation/usernotifications/unauthorizationstatus/ephemeral) | `true` | ![subscribed](https://img.shields.io/badge/-subscribed-brightgreen)
[`authorized`](), [`provisional`](https://developer.apple.com/documentation/usernotifications/unauthorizationstatus/provisional), [`ephemeral`](https://developer.apple.com/documentation/usernotifications/unauthorizationstatus/ephemeral) | `false` | ![unsubscribed](https://img.shields.io/badge/-unsubscribed-red) 
[`denied`](https://developer.apple.com/documentation/usernotifications/unauthorizationstatus/denied) | `true` | ![unsubscribed](https://img.shields.io/badge/-unsubscribed-red)
[`denied`](https://developer.apple.com/documentation/usernotifications/unauthorizationstatus/denied) | `false` | ![unsubscribed](https://img.shields.io/badge/-unsubscribed-red)

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
