import Foundation
import AbstractAnalytics

@Observable
final class OnboardingViewModel {

    enum Action {
        case finishOnboarding
        case tapEula
    }

    struct ViewState {
        let title = "Welcome to\nthe Demo App"
        let eulaLink = "https://github.com/SergeyPetrachkov/SPM-Modularisation-issue-demo"
        let shouldShowNavigationButton: Bool
        let items: [OnboardingItem] = [
            .init(
                title: "Why do you need it?",
                body:
                    "You don't. It's a showcase of a modularisation issue.",
                image: nil
            ),
            .init(
                title: "Read my article!",
                body:
                    "It has more details to what's going on here and how the issue is solved.",
                image: nil
            )
        ]

        init(shouldShowNavigationButton: Bool) {
            self.shouldShowNavigationButton = shouldShowNavigationButton
        }
    }

    private let flowNecessityResolver: OnboardingFlowNecessityResolver
    private let onFinish: () -> Void
    private let analytics: AnalyticsTracker

    var state: ViewState

    init(flowNecessityResolver: OnboardingFlowNecessityResolver, analytics: AnalyticsTracker, onFinish: @escaping () -> Void) {
        self.flowNecessityResolver = flowNecessityResolver
        self.analytics = analytics
        self.onFinish = onFinish
        self.state = .init(shouldShowNavigationButton: true)
    }

    init(analytics: AnalyticsTracker) {
        self.state = .init(shouldShowNavigationButton: false)
        self.analytics = analytics
        self.flowNecessityResolver = AlwaysShowOnboardingResolver()
        onFinish = {}
    }

    func send(_ action: Action) {
        switch action {
        case .finishOnboarding:
            analytics.track(event: .onboardingFinished(date: .now))
            flowNecessityResolver.setShouldShowOnboarding(value: false)
            onFinish()
        case .tapEula:
            analytics.track(event: .eulaTapped())
        }
    }
}
