import SwiftUI

@main
struct LMApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(AppConfig.preferredColorScheme)
        }
    }
}
