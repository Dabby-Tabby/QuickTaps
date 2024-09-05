import SwiftUI

struct ExpandLightAnimation: View {
    @State private var fontSize: CGFloat = 30
    var body: some View {
        Image(systemName: "circle.fill")
            .frame(width: 480, height: 480)
            .foregroundColor(.white)
            .font(.system(size: fontSize))
            .offset(y: -10)
            .onAppear{
                withAnimation(.easeInOut(duration: 1.7)) {
                    fontSize = 11.25 * fontSize
                }
            }
    }
}


#Preview {
    ExpandLightAnimation()
}
