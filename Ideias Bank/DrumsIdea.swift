import SwiftUI

struct DrumsContentView: View {
    
    @State var isAnimating = false
    
    var body: some View {
        ZStack {
                HStack {
                    Circle()
                    Circle()
                    Circle()
                    Circle()
                                
            }
            
            HStack {
                Circle()
                    .scaleEffect(self.isAnimating ?  0.5 : 1, anchor: .center)
                    .animation(Animation.linear(duration: 0.5).repeatForever(), value: isAnimating)
                Circle()
                    .offset(y: self.isAnimating ? -100 : 0)
                    .animation(Animation.easeInOut(duration: 0.5).repeatForever(), value: isAnimating)
                    .scaleEffect(0.5, anchor: .center)
                Circle()
                    .scaleEffect(self.isAnimating ? 0.1 : 1, anchor: .top)
                    .offset(y: self.isAnimating ? -100 : 0)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(), value: isAnimating)
                Circle()
            }
            .foregroundColor(.red)
        }
        .onAppear(perform: {
//            self.isAnimating.toggle()
            
        })
        .padding()
    }
    
}
