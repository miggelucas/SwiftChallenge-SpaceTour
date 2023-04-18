import SwiftUI


struct MoonSystem: View {
    let sunRadius: CGFloat = 800
    
    let distanceSunEarth: CGFloat = -750
    let earthRevolutionPeriod: CGFloat = 28
    let moonPeriod: CGFloat = 10
    
    @State var angleRotation: Angle = Angle(degrees: 0)
    
    var body: some View {
        ZStack{
            // Space
            SpaceView(numberOfStars: 25)
            
            VStack() {

                Spacer()
                
                // animation
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
                
                Spacer()
                
            
                
                
                
                
            }
            
            
            
            
            
        }
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

