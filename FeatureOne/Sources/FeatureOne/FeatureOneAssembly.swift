import SwiftUI
import AbstractAnalytics

public protocol FeatureOneAssembling {
    func makeFlow() -> FeatureOneView
}

public protocol FeatureOneFlowDependencyContaining {
    var analytics: any AnalyticsTracker { get }
}

public struct FeatureOneFlowDependencyContainer: FeatureOneFlowDependencyContaining {
    public let analytics: any AnalyticsTracker

    public init(analytics: any AnalyticsTracker) {
        self.analytics = analytics
    }
}

public struct FeatureOneAssembly: FeatureOneAssembling {

    private let analytics: any AnalyticsTracker

    public init(dependencies: FeatureOneFlowDependencyContaining) {
        analytics = dependencies.analytics
    }

    public func makeFlow() -> FeatureOneView {
        let viewModel = FeatureOneViewModel(analytics: analytics)
        let view = FeatureOneView(viewModel: viewModel)
        return view
    }
}
