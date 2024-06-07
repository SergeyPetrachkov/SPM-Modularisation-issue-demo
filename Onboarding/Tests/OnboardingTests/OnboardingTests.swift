import XCTest
import AbstractAnalytics
import AbstractAnalyticsMocks
@testable import Onboarding

final class OnboardingTests: XCTestCase {

    func test_whenOnboardingNotShown_andOnboardingFinishes_theFlagIsSetToCorrectState() throws {

        let mockOnboardingNecessityResolver = MockOnboardingFlowNecessityResolver(shouldShowOnboarding: true)
        let mockAnalytics = MockAnalyticsTracker()
        let sut = OnboardingViewModel(
            flowNecessityResolver: mockOnboardingNecessityResolver,
            analytics: mockAnalytics,
            onFinish: {}
        )

        sut.send(.finishOnboarding)

        XCTAssertTrue(mockOnboardingNecessityResolver.setShouldShowOnboardingCalled)
        XCTAssertFalse(mockOnboardingNecessityResolver.setShouldShowOnboardingInput.last ?? true)
        XCTAssertEqual(mockAnalytics.trackEventInput.last?.name, AnalyticsEvent.Event.onboardingFinished.rawValue)
    }
}
