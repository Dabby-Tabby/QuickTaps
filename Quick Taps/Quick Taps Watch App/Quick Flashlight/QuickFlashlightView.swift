import SwiftUI

struct QuickFlashlightView: View {
    @State private var isClicked = false
    @State private var clickCount = 0
    @State private var showText = true
    
    var body: some View {
        ZStack {
            if showText {
                Text("Tap for Flashlight")
                    .opacity(0.95)
                    .font(.headline)
                    .offset(y: -85)
                    .onAppear {
                        // Hide the text after 3 seconds with animation
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                showText = false
                            }
                        }
                    }
            }
            // The animations
            if isClicked == false && clickCount == 0 {
                LightPulseAnimation(isClicked: $isClicked)
            } else if isClicked == true {
                ExpandLightAnimation()
            } else if isClicked == false && clickCount > 0 {
                CollapseLightAnimation()
                LightPulseAnimation(isClicked: $isClicked)
            }

            // Overlaying the invisible button on top of everything
            Button(action: {
                isClicked.toggle()
                clickCount = clickCount + 1
            }) {
                Color.clear // Transparent button
                    .contentShape(Rectangle()) // Ensures the button covers the whole screen
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    QuickFlashlightView()
}
