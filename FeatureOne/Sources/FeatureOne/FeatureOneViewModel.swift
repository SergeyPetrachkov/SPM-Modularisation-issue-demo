import AbstractAnalytics
import Foundation

@Observable
public final class FeatureOneViewModel {

    enum Action {
        case tapButton
    }

    private let analytics: AnalyticsTracker

    init(analytics: AnalyticsTracker) {
        self.analytics = analytics
    }

    func send(_ action: Action) {
        switch action {
        case .tapButton:
            analytics.track(event: .featureOneTapped())
        }
    }
}
