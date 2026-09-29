import Foundation

public actor CorrelationEngine {
    private var events: [UUID: SecurityEvent] = [:]
    public init() {}
    public func ingest(_ event: SecurityEvent) -> SecurityEvent { events[event.id] = event; return event }
    public func allEvents() -> [SecurityEvent] { events.values.sorted { $0.timestamp > $1.timestamp } }
}
