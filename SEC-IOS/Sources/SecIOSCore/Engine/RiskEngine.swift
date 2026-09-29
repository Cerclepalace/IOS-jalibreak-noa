import Foundation

public struct RiskEngine: Sendable {
    public init() {}
    public func classify(_ event: SecurityEvent) -> RiskLevel {
        guard event.confidence >= 0.8 else { return .unknown }
        return event.risk
    }
}
