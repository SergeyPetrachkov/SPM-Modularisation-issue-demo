import AbstractAnalytics
import Onboarding
import FeatureOne
import Foundation

@Observable
final class AppNavigator {

    enum NavigationState: Identifiable, Hashable {

        case loading
        case onboarding(OnboardingView)
        case featureOne(FeatureOneView)

        var id: String {
            String(describing: self)
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }

        static func == (lhs: AppNavigator.NavigationState, rhs: AppNavigator.NavigationState) -> Bool {
            lhs.hashValue == rhs.hashValue
        }
    }

    private let onboardingAssembly: any OnboardingFlowAssembling
    private let analyticsAssembly: any AnalyticsAssembling

    private(set) var navigationState: NavigationState = .loading

    var navigationStack: [NavigationState] = []
    var presentedSheet: NavigationState?

    init(
        onboardingAssembly: any OnboardingFlowAssembling,
        analyticsAssembly: any AnalyticsAssembling
    ) {
        self.onboardingAssembly = onboardingAssembly
        self.analyticsAssembly = analyticsAssembly
    }

    func start() {
        let onboardingFlowNecessityResolver = onboardingAssembly.makeOnboardingFlowNecessityResolver()
        if onboardingFlowNecessityResolver.shouldShowOnboarding() {
            navigationState = .onboarding(
                onboardingAssembly.makeOnboardingFlow(
                    onFinish: { [weak self] in
                        guard let self else { return }
                        showMainScreen()
                    }
                )
            )
        } else {
            showMainScreen()
        }
    }

    private func showMainScreen() {
        let featureOneAssembly = FeatureOneAssembly(
            dependencies: FeatureOneFlowDependencyContainer(analytics: analyticsAssembly.analytics())
        )
        let flow = featureOneAssembly.makeFlow()
        navigationState = .featureOne(flow)
    }
}

extension AppNavigator {
    static func make() -> AppNavigator {
        let analyticsAssembly = AnalyticsAssembly()
        return AppNavigator(
            onboardingAssembly: OnboardingFlowAssembly(
                dependencies: OnboardingFlowDependencyContainer(
                    analytics: analyticsAssembly.analytics()
                )
            ),
            analyticsAssembly: analyticsAssembly
        )
    }
}
