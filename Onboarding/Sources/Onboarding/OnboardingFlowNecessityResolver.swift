import Foundation

public protocol OnboardingFlowNecessityResolver {
    func shouldShowOnboarding() -> Bool

    func setShouldShowOnboarding(value: Bool)
}

final class DefaultsOnboardingFlowNecessityResolver: OnboardingFlowNecessityResolver {

    private let userDefaults: UserDefaults

    private var shownOnboarding: Bool {
        get {
            userDefaults.bool(forKey: UserDefaultsKeys.shownOnboarding.rawValue)
        }
        set {
            userDefaults.setValue(newValue, forKey: UserDefaultsKeys.shownOnboarding.rawValue)
        }
    }

    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }

    func shouldShowOnboarding() -> Bool {
        !shownOnboarding
    }

    func setShouldShowOnboarding(value: Bool) {
        shownOnboarding = !value
    }
}

struct AlwaysShowOnboardingResolver: OnboardingFlowNecessityResolver {
    func shouldShowOnboarding() -> Bool {
        true
    }

    func setShouldShowOnboarding(value: Bool) {
        // no op
    }
}
