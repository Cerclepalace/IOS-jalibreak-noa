# SEC-iOS

Security Observation, Detection, Correlation and Evidence system for iPhone.

## Scope

SEC-iOS operates only through capabilities exposed by iOS and Apple public frameworks. It does not bypass iOS protections, inspect arbitrary processes/files, or treat unknown observations as compromise.

## Current baseline

- Device observation
- Bluetooth LE discovery
- Local-network discovery
- Network state monitoring
- Evidence collection and hashing
- Correlation engine
- Risk classification
- Security graph model
- SwiftUI dashboard foundation

## State model

UNKNOWN -> OBSERVED -> CORRELATED -> SUSPECTED -> VERIFIED

On error: ERROR -> REJECTED -> LAST VALID STATE.

## Repository rule

No security conclusion is accepted without an observable evidence chain.
