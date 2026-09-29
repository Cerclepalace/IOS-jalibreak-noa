import Foundation

public struct DiscoveredDevice: Identifiable, Codable, Sendable, Hashable {
    public let id: String
    public let name: String?
    public let rssi: Int?
    public let manufacturerDataHex: String?
    public let serviceUUIDs: [String]
    public let firstSeen: Date
    public var lastSeen: Date
    public var discoveryCount: Int

    public init(id: String, name: String? = nil, rssi: Int? = nil, manufacturerDataHex: String? = nil, serviceUUIDs: [String] = [], firstSeen: Date = .now, lastSeen: Date = .now, discoveryCount: Int = 1) {
        self.id = id; self.name = name; self.rssi = rssi; self.manufacturerDataHex = manufacturerDataHex; self.serviceUUIDs = serviceUUIDs
        self.firstSeen = firstSeen; self.lastSeen = lastSeen; self.discoveryCount = discoveryCount
    }
}
