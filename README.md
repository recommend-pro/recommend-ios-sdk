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
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        Recommend.shared.applicationWillEnterForeground()
    }
```

### Messaging

Check the [Messaging Guide](https://github.com/recommend-pro/recommend-ios-sdk/blob/main/GUIDES/MESSAGING_GUIDE.md).

### Device Tracking

Check the [Device Tracking Guide](https://github.com/recommend-pro/recommend-ios-sdk/blob/main/GUIDES/DEVICE_TRACKING_GUIDE.md).

### Recommendations

Check the [Recommendations Guide](https://github.com/recommend-pro/recommend-ios-sdk/blob/main/GUIDES/RECOMMENDATIONS_GUIDE.md).

## License

The contents of this repository are licensed under the
[MIT License](https://github.com/recommend-pro/recommend-ios-sdk/blob/main/LICENSE).
