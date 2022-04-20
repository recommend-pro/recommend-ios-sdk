# Recommend iOS SDK

## Requirements

* **iOS 11.0+**

## Installation

See the subsections below for details about the different installation methods.
1. [CocoaPods](#cocoapods)
2. [Swift Package Manager](#swift-package-manager)

### CocoaPods

1. Prepare project for CocoaPods usage by [CocoaPods - Install / Get Started](https://cocoapods.org)
2. Add pod to project's profile
```ruby
pod 'Recommend'
```
3. Install pods
```console
cd {PATH_TO_PROJECT}
pod install
```

### Swift Package Manager

1. Go to project
2. `File` → `Add Packages...`
3. Search for library, using URL: 
```
https://github.com/recommend-pro/recommend-ios-sdk
```
4. Set the `Dependency Rule` to `Up to Next Major Version`
5. `Add Package`

## Usage

### Setup

1. Integrate SDK to project
2. Setup AppDelegate

AppDelegate:
```swift
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        Recommend.initialize(
            accountId: "00000000",
            applicationName: "Example-iOS-Dev", // [Optional] For Push Notifications integration
            apiHost: "recommend.example.com") // If custom
        
        Recommend.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions)
        return true
    }
```

### Push Notifications

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

### Device Activity

1. Prepare activity
2. Prepare device activity
3. Track device activity

Exmaple:
```swift
let activity: [RECActivity] = [
    RECLoginActivity()
]

let metrics = RECMetrics(
    nonInteractive: true,
    data: [
        "segment": "A"
    ])

let deviceActivity = RECDeviceActivity(
    customerIdHash: "0a0a0a0a0a0a0a0a0a0a0a0",
    store: "default",
    currency: "GBP",
    environment: "default",
    priceList: "default",
    deviceTime: .current,
    eventTime: Int(Date().timeIntervalSince1970),
    metrics: metrics,
    activity: activity)

Recommend.shared.trackDeviceActivity(deviceActivity)
```

### Recommendation Panels

1. Prepare fetch model
2. Fetch panels

```swift
let priceList = RECPriceList(
    code: "vip",
    fallbackMode: .alternative,
    alternatives: ["default"])

let metrics = RECMetrics(
    nonInteractive: true,
    data: [
        "segment": "A"
    ])

let panels: [RECRecommendationPanelsFetchModel.Panel] = [
    .init(
        id: "string",
        context: RECRecommendationPanelRequest.Context(
            searchTerm: "Shoes",
            current: RECRecommendationPanelRequest.Context.CurrentContext(
                sku: "CSF-3",
                listId: "6"),
            skus: [
                "CSF-1",
                "CSF-2"
            ],
            listIds: [
                "5",
                "10"
            ]),
        filters: [
            RECRecommendationPanelRequest.Filter(
                type: .product,
                code: "sku",
                operator: .ne,
                value: "CSF-1")
        ],
        attrsToInclude: [
            "gender"
        ],
        variations: RECRecommendationPanelRequest.Variations(
            include: true,
            attrsToInclude: [
                "gender"
            ])
    )
]

let previewPanel = RECRecommendationPanelsFetchModel.PreviewPanel(
    global: false,
    ids: [
        "panel-1",
        "panel-2"
    ])

let fetchModel = RECRecommendationPanelsFetchModel(
    deviceId: "0000000-0000-0000-00000000",
    customerIdHash: "0a0a0a0a0a0a0a0a0a0a0a0",
    store: "default",
    currency: "GBP",
    environment: "default",
    priceList: priceList,
    metrics: metrics,
    pageType: "string",
    panels: panels,
    previewPanel: previewPanel)
```

## License

The contents of this repository are licensed under the
[MIT License](https://github.com/recommend-pro/recommend-ios-sdk/blob/main/LICENSE).
