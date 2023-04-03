import SwiftUI


struct TideSystem: View {
    let sunRadius: CGFloat = 100
    
    let distanceSunEarth: CGFloat = 350
    let earthRevolutionPeriod: CGFloat = 30
    let moonPeriod: CGFloat = 10
    
    @State private var earthAngle: Angle = .degrees(0)
    
    var tidePeriod: CGFloat {
        return earthRevolutionPeriod / (earthRevolutionPeriod / moonPeriod)
    }
    
    var body: some View {
        ZStack{
            
            // Sun
            PlanetView(radius: sunRadius * 1.5, color: .yellow)
            
            // sum, moon and tide
            EarthSystem(moonRevolutionPeriod: moonPeriod,
                        tidePeriod: tidePeriod)
                .offset(x: distanceSunEarth)
                .rotationEffect(earthAngle, anchor: .center)
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

