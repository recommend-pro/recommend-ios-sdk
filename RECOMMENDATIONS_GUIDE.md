# Recommend Recommendations

## Usage

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
    
            
Recommend.shared.fetchPanels(with: fetchModel) { result in
    switch result {
    case .success(let recommendationPanels):
        // handle recommendation panels
    case .failure(let error):
        // handle error
    }
}
```
