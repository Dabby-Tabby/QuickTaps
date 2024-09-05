import SwiftUI

struct CollapseLightAnimation: View {
    @State private var fontSize: CGFloat = 338
    @State private var opacity: Double = 1.0

    var body: some View {
        Image(systemName: "circle.fill")
            .frame(width: 480, height: 480)
            .foregroundColor(.white)
            .font(.system(size: fontSize))
            .shadow(color: .white, radius: fontSize)
            .offset(y: -10)
            .opacity(opacity) // Apply opacity
            .onAppear {
                withAnimation(.easeInOut(duration: 1.3)) {
                    fontSize = 20
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) { // Delay to match the shrinking animation
                    withAnimation(.easeInOut(duration: 1.0)) {
                        
                        opacity = 0.0 // Fade out the circle
                    }
                }
            }
    }
}

#Preview {
    CollapseLightAnimation()
}
