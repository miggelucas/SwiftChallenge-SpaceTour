import SwiftUI


struct MoonSystem: View {
    let sunRadius: CGFloat = 800
    
    let distanceSunEarth: CGFloat = -750
    let earthRevolutionPeriod: CGFloat = 28
    let moonPeriod: CGFloat = 10
    
    @State var angleRotation: Angle = Angle(degrees: 0)
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        ZStack{
            // Space
            SpaceView(numberOfStars: 25)
            
            ZStack {
                // Sun
                PlanetView(radius: sunRadius,
                           color: .yellow)
                .offset(x: distanceSunEarth)
                
                ZStack {
                    // earth
                    PlanetView(radius: 100,
                               color: .blue)
                    
                    MoonPhasesView(moonPhasePeriod: earthRevolutionPeriod)
                        .offset(x: 200)
                        .rotationEffect(angleRotation)
                    
                }
                
            }
            .offset(x: 100, y: -100)
            .scaleEffect(scale)
            
            
            
            VStack {
                Spacer()
                TextContentView(textString: "The moon's position in relation to the sun influences our perception of it. What we see of the moon is the reflection of sunlight, so when the moon is positioned between the sun and the earth, we are not able to observe it. On the other hand, when we are positioned between the sun and the moon, the light rays can reach the moon and be reflected within our visual field.")
                
                    .padding()
            }
           
            
            
            
            
        }
        .gesture(MagnificationGesture()
            .onChanged { value in
                self.scale = value.magnitude
            })
        .onAppear {
            withAnimation(Animation.linear(duration: earthRevolutionPeriod).repeatForever(autoreverses: false)) {
                self.angleRotation = .degrees(360)
            }
        }
        
    }
}

struct MoonSystem_Previews: PreviewProvider {
    static var previews: some View {
        MoonSystem()
    }
}

