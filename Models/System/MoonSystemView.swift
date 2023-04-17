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
            
            VStack(spacing: 200) {
                
                ZStack {
                    // Sun
                    PlanetView(radius: sunRadius,
                               color: .yellow)
                    .offset(x: distanceSunEarth)
                    
                    ZStack {
                        // earth
                        PlanetView(radius: 100,
                                   color: .blue)
                        // moon
                        PlanetView(radius: 50,
                                   color: .white)
                        .offset(x: 200)
                        .rotationEffect(angleRotation)
                        
                    }
                    
                }
 
                

                ZStack {
                    Color(.gray)
                        .opacity(0.3)
                    Text("The moon's position in relation to the sun influences our perception of it. What we see of the moon is the reflection of sunlight, so when the moon is positioned between the sun and the earth, we are not able to observe it . On the other hand, when we are positioned between the sun and the moon, the light rays can reach the moon and be reflected within our visual field.")
                        .foregroundColor(.accentColor)
                        .font(.title)
                        .lineSpacing(2)
                        .padding(.horizontal, 100)
                }
                .cornerRadius(15)
                .frame(height: 300)
                .padding()
                
               
                
                
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

