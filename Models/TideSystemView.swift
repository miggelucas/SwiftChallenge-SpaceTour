import SwiftUI


struct TideSystem: View {
    let sunRadius: CGFloat = 100
    
    let distanceSunEarth: CGFloat = 350
    let earthRevolutionPeriod: CGFloat = 28
    let moonPeriod: CGFloat = 10
    
    @State private var earthAngle: Angle = .degrees(0)
    
    var tidePeriod: CGFloat {
        return earthRevolutionPeriod / (earthRevolutionPeriod / moonPeriod)
    }
    
    var body: some View {
        ZStack{
            // Space
            SpaceView()
            
            // Sun
            PlanetView(radius: sunRadius * 1.5, color: .yellow)
                .offset(x: distanceSunEarth)
                .rotationEffect(earthAngle, anchor: .center)
            
            
            // sum, moon and tide
            EarthSystem(moonRevolutionPeriod: moonPeriod,
                        tidePeriod: tidePeriod)
            
            
        }
        .onAppear {
            withAnimation(Animation.linear(duration: earthRevolutionPeriod).repeatForever(autoreverses: false)) {
                self.earthAngle = .degrees(360)
            }
        }
        
    }
}

struct TideSystem_Previews: PreviewProvider {
    static var previews: some View {
        TideSystem()
    }
}

