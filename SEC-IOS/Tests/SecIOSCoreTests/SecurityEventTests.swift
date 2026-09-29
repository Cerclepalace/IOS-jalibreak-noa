import XCTest
@testable import SecIOSCore

final class SecurityEventTests: XCTestCase {
    func testConfidenceIsBounded() {
        let event = SecurityEvent(source: "test", observation: [:], confidence: 2)
        XCTAssertEqual(event.confidence, 1)
    }

    func testUnknownDoesNotBecomeRisk() {
        let event = SecurityEvent(source: "test", observation: [:], confidence: 0.2, risk: .unknown)
        XCTAssertEqual(RiskEngine().classify(event), .unknown)
    }
}
