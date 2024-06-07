import SwiftUI
import AbstractAnalytics

public protocol OnboardingFlowAssembling {
    func makeOnboardingFlow(onFinish: @escaping () -> Void) -> OnboardingView
    func makeAboutUsFlow() -> OnboardingView
    func makeOnboardingFlowNecessityResolver() -> OnboardingFlowNecessityResolver
}

public protocol OnboardingFlowDependencyContaining {
    var analytics: any AnalyticsTracker { get }
}

public struct OnboardingFlowDependencyContainer: OnboardingFlowDependencyContaining {
    public let analytics: any AnalyticsTracker

    public init(analytics: any AnalyticsTracker) {
        self.analytics = analytics
    }
}

public struct OnboardingFlowAssembly: OnboardingFlowAssembling {

    private let onboardingFlowNecessityResolver = DefaultsOnboardingFlowNecessityResolver()
    private let analytics: any AnalyticsTracker

    public init(dependencies: OnboardingFlowDependencyContaining) {
        analytics = dependencies.analytics
    }

    public func makeOnboardingFlow(onFinish: @escaping () -> Void) -> OnboardingView {
        let viewModel = OnboardingViewModel(
            flowNecessityResolver: onboardingFlowNecessityResolver,
            analytics: analytics,
            onFinish: onFinish
        )
        let view = OnboardingView(viewModel: viewModel)
        return view
    }

    public func makeAboutUsFlow() -> OnboardingView {
        let viewModel = OnboardingViewModel(analytics: analytics)
        let view = OnboardingView(viewModel: viewModel)
        return view
    }

    public func makeOnboardingFlowNecessityResolver() -> OnboardingFlowNecessityResolver {
        onboardingFlowNecessityResolver
    }
}
