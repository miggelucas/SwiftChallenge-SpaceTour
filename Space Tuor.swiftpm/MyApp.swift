import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .onAppear {
                        MusicPlayer.shared.play()
                    }
            }
                
        }
    }
}
