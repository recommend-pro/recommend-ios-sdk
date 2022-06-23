# Recommend Device Tracking

## Device Activity Tracking

### Usage

1. Prepare device activity
2. Prepare device tracking request
3. Track device activity

Exmaple:
```swift
let activity: [RECDeviceActivity] = [
    RECDeviceLoginActivity()
]

let metrics = RECMetrics(
    nonInteractive: true,
    data: [
        "segment": "A"
    ])

let requestModel = RECDeviceTrackingRequest(
    customerIdHash: "0a0a0a0a0a0a0a0a0a0a0a0",
    store: "default",
    currency: "GBP",
    environment: "default",
    priceList: "default",
    deviceTime: .current,
    eventTime: Int(Date().timeIntervalSince1970),
    metrics: metrics,
    activity: activity)

Recommend.shared.trackDeviceActivity(requestModel)
```
