import SwiftUI

@main
struct SecIOSApp: App {
    var body: some Scene { WindowGroup { SecurityDashboardView() } }
}

struct SecurityDashboardView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Security Status") {
                    Label("NORMAL", systemImage: "checkmark.shield")
                    Text("No verified security risk").foregroundStyle(.secondary)
                }
                Section("Observation") {
                    NavigationLink("Devices", destination: Text("Device inventory"))
                    NavigationLink("Network", destination: Text("Network state"))
                    NavigationLink("Events", destination: Text("Security events"))
                    NavigationLink("Evidence", destination: Text("Evidence store"))
                }
            }.navigationTitle("SEC-iOS")
        }
    }
}
