import Onboarding

final class MockOnboardingFlowNecessityResolver: OnboardingFlowNecessityResolver {

    init(shouldShowOnboarding: Bool) {
        _shouldShowOnboarding = shouldShowOnboarding
    }

    var shouldShowOnboardingCallsCount = 0
    var shouldShowOnboardingCalled: Bool {
        setShouldShowOnboardingCallsCount > 0
    }
    var _shouldShowOnboarding: Bool

    func shouldShowOnboarding() -> Bool {
        shouldShowOnboardingCallsCount += 1
        return _shouldShowOnboarding
    }

    var setShouldShowOnboardingCallsCount = 0
    var setShouldShowOnboardingInput: [Bool] = []
    var setShouldShowOnboardingCalled: Bool {
        setShouldShowOnboardingCallsCount > 0
    }
    func setShouldShowOnboarding(value: Bool) {
        setShouldShowOnboardingCallsCount += 1
        setShouldShowOnboardingInput.append(value)
    }
}
