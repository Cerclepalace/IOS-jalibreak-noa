import Foundation
import CryptoKit

public actor EvidenceEngine {
    public init() {}

    public func seal(_ event: SecurityEvent) throws -> SecurityEvent {
        let payload = try JSONEncoder().encode(event)
        let digest = SHA256.hash(data: payload)
        let hash = digest.map { String(format: "%02x", $0) }.joined()
        return SecurityEvent(id: event.id, timestamp: event.timestamp, source: event.source, observation: event.observation, status: event.status, confidence: event.confidence, risk: event.risk, relatedEventIDs: event.relatedEventIDs, evidenceHash: hash)
    }
}
