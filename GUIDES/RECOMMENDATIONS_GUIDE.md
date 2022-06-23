# Recommendations

## Recommendation Panels

### Usage

1. Prepare recommendation panels request
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

let panels: [RECRecommendationPanelRequest] = [
    .init(
        id: "string",
        context: RECRecommendationPanelRequestContext(
            searchTerm: "Shoes",
            current: RECRecommendationPanelRequestCurrentContext(
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
            RECRecommendationPanelRequestFilter(
                type: .product,
                code: "sku",
                operator: .ne,
                value: "CSF-1")
        ],
        attrsToInclude: [
            "gender"
        ],
        variations: RECRecommendationPanelRequestVariations(
            include: true,
            attrsToInclude: [
                "gender"
            ])
    )
]

let previewPanel = RECRecommendationPreviewPanelRequest(
    global: false,
    ids: [
        "panel-1",
        "panel-2"
    ])

let requestModel = RECRecommendationPanelsRequest(
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
    
            
Recommend.shared.fetchPanels(with: requestModel) { result in
    switch result {
    case .success(let recommendationPanels):
        // handle recommendation panels
    case .failure(let error):
        // handle error
    }
}
```
