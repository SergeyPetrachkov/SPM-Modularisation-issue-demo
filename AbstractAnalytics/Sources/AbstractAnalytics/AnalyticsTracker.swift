import Foundation

/// An interface for any logging entity
public protocol AnalyticsTracker: Sendable {
    /// Log an event defined within the system
    func track(event: AnalyticsEvent)
    /// Log errors
    func track(error: Error)
}
