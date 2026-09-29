import Foundation

public enum EvidenceStatus: String, Codable, Sendable {
    case unknown, observed, correlated, suspected, verified, rejected
}

public enum RiskLevel: String, Codable, Sendable {
    case unknown, normal, observation, anomaly, risk
}

public struct SecurityEvent: Codable, Identifiable, Sendable, Hashable {
    public let id: UUID
    public let timestamp: Date
    public let source: String
    public let observation: [String: String]
    public let status: EvidenceStatus
    public let confidence: Double
    public let risk: RiskLevel
    public let relatedEventIDs: [UUID]
    public let evidenceHash: String?

    public init(id: UUID = UUID(), timestamp: Date = .now, source: String, observation: [String: String], status: EvidenceStatus = .observed, confidence: Double, risk: RiskLevel = .unknown, relatedEventIDs: [UUID] = [], evidenceHash: String? = nil) {
        self.id = id; self.timestamp = timestamp; self.source = source; self.observation = observation
        self.status = status; self.confidence = min(max(confidence, 0), 1); self.risk = risk
        self.relatedEventIDs = relatedEventIDs; self.evidenceHash = evidenceHash
    }
}
