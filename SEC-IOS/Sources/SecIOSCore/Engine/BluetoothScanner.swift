import Foundation
#if canImport(Combine)
import Combine
#endif
#if canImport(CoreBluetooth)
import CoreBluetooth
#endif

#if canImport(CoreBluetooth) && canImport(Combine)
public final class BluetoothScanner: NSObject, ObservableObject, CBCentralManagerDelegate {
    @Published public private(set) var devices: [DiscoveredDevice] = []
    private var central: CBCentralManager!

    public override init() {
        super.init()
        central = CBCentralManager(delegate: self, queue: nil)
    }

    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        guard central.state == .poweredOn else { return }
        central.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey: false])
    }

    public func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        let now = Date()
        let identifier = peripheral.identifier.uuidString
        if let index = devices.firstIndex(where: { $0.id == identifier }) {
            var current = devices[index]
            current.lastSeen = now
            current.discoveryCount += 1
            devices[index] = current
            return
        }

        let services = (advertisementData[CBAdvertisementDataServiceUUIDsKey] as? [CBUUID] ?? []).map(\.uuidString)
        devices.append(
            DiscoveredDevice(
                id: identifier,
                name: peripheral.name,
                rssi: RSSI.intValue,
                serviceUUIDs: services,
                firstSeen: now,
                lastSeen: now
            )
        )
    }
}
#endif
