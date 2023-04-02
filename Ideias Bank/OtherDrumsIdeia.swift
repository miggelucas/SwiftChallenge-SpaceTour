import SwiftUI


struct TestContentView: View {
    let bpm: Double = 120 // Valor preestabelecido de BPM
    let animationDuration: Double = 15 // Duração da animação em segundos (1 BPM = 1 segundo)
    
    var body: some View {
        ZStack {
            
            CircleView(color: .green)
            AnimatedCircleView(color: .green, bpm: bpm, animationDuration: animationDuration, fraction: 0.5)
            
        }
    }
}

struct CircleView: View {
    let color: Color
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 50, height: 50)
    }
}

struct AnimatedCircleView: View {
    let color: Color
    let bpm: Double
    let animationDuration: Double
    var duration : Double {
        animationDuration / (bpm / 60)
    }
    let fraction: Double
    @State var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: CGFloat(isAnimating ? 0 : fraction))
                .stroke(color, lineWidth: 4)
                .frame(width: 50, height: 50)
                .scaleEffect(2, anchor: .center)
                .animation(Animation.linear(duration: self.duration).repeatForever(autoreverses: false), value: isAnimating)
               
        }
        .onAppear{
            isAnimating.toggle()
        }
       
   
        
        
    }
    
    
    
}


