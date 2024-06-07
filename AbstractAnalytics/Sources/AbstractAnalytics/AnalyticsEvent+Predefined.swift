import Foundation

public extension AnalyticsEvent {

    enum Event: String, Sendable {
        case onboardingFinished = "onboarding_finished"
        case eulaTapped = "eula_tapped"
        case feature1Tapped = "feature_one_tapped"
    }

    static func onboardingFinished(date: Date) -> AnalyticsEvent {
        AnalyticsEvent(
            name: Event.onboardingFinished.rawValue,
            params: ["date": date.formatted(date: .complete, time: .complete)]
        )
    }

    static func eulaTapped() -> AnalyticsEvent {
        AnalyticsEvent(name: Event.eulaTapped.rawValue, params: [:])
    }

    static func featureOneTapped() -> AnalyticsEvent {
        AnalyticsEvent(name: Event.feature1Tapped.rawValue, params: [:])
    }
}
