# Recommend Device Tracking

## Usage

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
