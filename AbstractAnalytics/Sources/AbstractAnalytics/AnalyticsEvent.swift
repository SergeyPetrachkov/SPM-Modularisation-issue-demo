import Foundation

public struct AnalyticsEvent: Sendable, Equatable {
    public let name: String
    public let params: [String: String]

    public init(name: String, params: [String : String]) {
        self.name = name
        self.params = params
    }
}
