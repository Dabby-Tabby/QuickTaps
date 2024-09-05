import SwiftUI

struct LightPulseAnimation: View {
    @State var heartPulse: CGFloat = 1
    @Binding var isClicked: Bool
    
    var body: some View {
        Image(systemName: "circle.fill")
            .frame(width: 100, height: 100)
            .foregroundColor(.white)
            .scaleEffect(heartPulse)
            .offset(y: -10)
            .shadow(color: .white, radius: 10)
            .onAppear {
                withAnimation(.easeInOut(duration: 3.0).repeatForever(autoreverses: true)) {
                    heartPulse = 1.85
                }
            }
    }
}
