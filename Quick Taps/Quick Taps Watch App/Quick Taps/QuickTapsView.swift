import SwiftUI

struct QuickTapsView: View {
    @State private var selectedTab = 1

    var body: some View {
        TabView(selection: $selectedTab) {
            QuickNotesView()
                .tabItem { Text("Voice Notes") }
                .tag(1)

            QuickFlashlightView()
                .tabItem { Text("Flashlight") }
                .tag(2)
        }
    }
}

#Preview {
    QuickTapsView()
}
