import AbstractAnalytics

public final class MockAnalyticsTracker: AnalyticsTracker, @unchecked Sendable {

    public init() { }

    public private(set) var trackEventCallsCount = 0
    public private(set) var trackEventInput: [AnalyticsEvent] = []
    public var trackEventCalled: Bool {
        trackEventCallsCount > 0
    }

    public func track(event: AnalyticsEvent) {
        trackEventCallsCount += 1
        trackEventInput.append(event)
    }

    public private(set) var trackErrorCallsCount = 0
    public private(set) var trackErrorInput: [any Error] = []
    public var trackErrorCalled: Bool {
        trackErrorCallsCount > 0
    }
    public func track(error: any Error) {
        trackErrorCallsCount += 1
        trackErrorInput.append(error)
    }
}
