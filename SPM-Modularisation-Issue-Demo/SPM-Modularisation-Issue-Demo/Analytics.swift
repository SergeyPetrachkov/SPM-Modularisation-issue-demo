import AbstractAnalytics
import Foundation
import OSLog

public extension OSLog {
    static let subsystem = "SPM-Modularisation-Demo"
    static let userActivity = OSLog(subsystem: subsystem, category: "user_activity")
}

public final class OSLogger: AnalyticsTracker {

    public init() {}

    public func track(event: AnalyticsEvent) {
        os_log("ℹ️ %{public}@ %{private}@", log: OSLog.userActivity, type: .info, event.name, event.params)
    }

    public func track(error: any Error) {
        os_log("❌ Error description: %{public}@", log: OSLog.userActivity, type: .error, "\(error.localizedDescription)")
    }
}


final class AnalyticsAssembly: AnalyticsAssembling {

    private let _analytics = AnalyticsMaster(
        trackers: [
            OSLogger(), // add any other analytics destination (like Firebase/Mixpanel/etc)
        ]
    )

    func analytics() -> any AnalyticsTracker {
        _analytics
    }
}

final class AnalyticsMaster: AnalyticsTracker {

    let trackers: [AnalyticsTracker]

    init(trackers: [AnalyticsTracker]) {
        self.trackers = trackers
    }

    func track(event: AnalyticsEvent) {
        for tracker in trackers {
            tracker.track(event: event)
        }
    }

    func track(error: any Error) {
        for tracker in trackers {
            tracker.track(error: error)
        }
    }
}
