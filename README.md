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
4. Set the `Dependency Rule` to `Up to Next Major Version` or `Exact Version`
5. `Add Package`

## Configuration

1. Add SDK to project (See [Installation](#installation))
2. [Configure shared instance](#shared-instance-configuration) or [create custom](#custom-instance-creation).

> **Important**: Account Id must not be empty.

### Shared instance configuration

Shared instance can be configured from [plist](#plist-creation) or directly with parameters.

```swift
import Recommend

...

func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
    Recommend.configure()
    return true
}
```
```swift
import Recommend

...

func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
    Recommend.configure(accoundId: "0e1x2a3m4p5l")
    return true
}
```

### Custom intance creation

```swift
let recommend = Recommend(accoundId: "0e1x2a3m4p5l")
```

### Plist creation

Unless plist is not auto-generation, it can be created manually following instructions.
All information is in access on [control.recommend.pro](https://control.recommend.pro/)

Example file provided in repo -> [Recommend-Info.plist](https://github.com/recommend-pro/recommend-ios-sdk/blob/main/Recommend-Info.plist)

| Field | Type | Required | Description |
| ---- | :----: | :----: | ---- |
| `ACCOUNT_ID` | String | + | Account id |
| `PUSH_APPLICATION_NAME_PROD` | String | - | Apple-iOS-Prod Push integration Application Name. Uses for release builds, usually from Xcode. |
| `PUSH_APPLICATION_NAME_DEV` | String | - | Apple-iOS-Dev Push integration Application Name. Uses for debug builds, usually from App Store Connect / TestFlight. |
| `API_HOST` | String | - | API host (domain). Can be empty. By default: `api.recommend.pro`. |

## License

The contents of this repository are licensed under the
[MIT License](https://github.com/recommend-pro/recommend-ios-sdk/blob/main/LICENSE).
