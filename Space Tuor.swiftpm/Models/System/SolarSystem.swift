//
//  SolarSystem.swift
//  Tide Effect
//
//  Created by Lucas Migge de Barros on 03/04/23.
//

import SwiftUI

struct SolarSystem: View {
    @State var isAnimating: Bool = false
    
    @State var scale: CGFloat = 1.0
    @State var position: CGSize = .zero
    
    @State var opacityHint: Double = 1
    @State var opacityTrivia: Double = 0
    
    // distance to sum
    let mercuryDistance: CGFloat = 65
    let venusDistance: CGFloat = 90
    let earthDistance: CGFloat = 120
    let marsDistance: CGFloat = 140
    let jupiterDistance: CGFloat = 240
    let saturnDistance: CGFloat = 370
    let uranosDistance: CGFloat = 430
    let neptuneDistance: CGFloat = 465
    
    // startingAngles
    let mercuryStartingAngle: Double = Double.random(in: 0...360)
    let venusStartingAngle: Double = Double.random(in: 0...360)
    let earthStartingAngle: Double = Double.random(in: 0...360)
    let marsStartingAngle: Double = Double.random(in: 0...360)
    let jupiterStartingAngle: Double = Double.random(in: 0...360)
    let saturnStartingAngle: Double = Double.random(in: 0...360)
    let uranosStartingAngle: Double = Double.random(in: 0...360)
    let neptuneStartingAngle: Double = Double.random(in: 0...360)
    

    var body: some View {
        ZStack {
            SpaceView(numberOfStars: 50)
            
            ZStack {
                                
                // Sum
                // planet but it's a star actually
                PlanetView(radius: 100, color: .yellow)
                    .blur(radius: 2)
                
                
                // Mercury
                ZStack {
                    OrbitalPathView(radius: mercuryDistance)
                    PlanetView(radius: 5, color: .gray)
                        .offset(x: mercuryDistance)
                        .rotationEffect(isAnimating ? Angle(degrees: mercuryStartingAngle + 360) : Angle(degrees: mercuryStartingAngle))
                        .animation(.linear(duration: 0.88)
                            .repeatForever(autoreverses: false), value: isAnimating)
                }
                
                
                // Venus
                ZStack {
                    OrbitalPathView(radius: venusDistance)
                    PlanetView(radius: 10, color: .yellow)
                        .offset(x: venusDistance)
                        .rotationEffect(isAnimating ? Angle(degrees: venusStartingAngle + 360) : Angle(degrees: venusStartingAngle))
                        .animation(.linear(duration: 2.25)
                            .repeatForever(autoreverses: false), value: isAnimating)
                }
                
                // Earth
                ZStack {
                    OrbitalPathView(radius: earthDistance)
                    PlanetView(radius: 12, color: .blue)
                        .offset(x: earthDistance)
                        .rotationEffect(isAnimating ? Angle(degrees: earthStartingAngle + 360) : Angle(degrees: earthStartingAngle))
                        .animation(.linear(duration: 3.65)
                            .repeatForever(autoreverses: false), value: isAnimating)
                }
                
                // Mars
                ZStack {
                    OrbitalPathView(radius: marsDistance)
                    PlanetView(radius: 6, color: .red)
                        .offset(x: marsDistance)
                        .rotationEffect(isAnimating ? Angle(degrees: marsStartingAngle + 360) : Angle(degrees: marsStartingAngle))
                        .animation(.linear(duration: 6.87)
                            .repeatForever(autoreverses: false), value: isAnimating)
                }
                
                // Jupiter
                ZStack {
                    OrbitalPathView(radius: jupiterDistance)
                    PlanetView(radius: 60, color: .orange)
                        .offset(x: jupiterDistance)
                        .rotationEffect(isAnimating ? Angle(degrees: jupiterStartingAngle + 360) : Angle(degrees: jupiterStartingAngle))
                        .animation(.linear(duration: 43.33)
                            .repeatForever(autoreverses: false), value: isAnimating)
                }
                
                // Saturn
                ZStack {
                    OrbitalPathView(radius: saturnDistance)
                    PlanetView(radius: 50, color: .orange)
                        .offset(x: saturnDistance)
                        .rotationEffect(isAnimating ? Angle(degrees: saturnStartingAngle + 360) : Angle(degrees: saturnStartingAngle))
                        .animation(.linear(duration: 107.59)
                            .repeatForever(autoreverses: false), value: isAnimating)
                }
                
                // Uranos
                ZStack {
                    OrbitalPathView(radius: uranosDistance)
                    PlanetView(radius: 40, color: .cyan)
                        .offset(x: uranosDistance)
                        .rotationEffect(isAnimating ? Angle(degrees: uranosStartingAngle + 360) : Angle(degrees: uranosStartingAngle))
                        .animation(.linear(duration: 306.87)
                            .repeatForever(autoreverses: false), value: isAnimating)
                }
                
                // Neptune
                ZStack {
                    OrbitalPathView(radius: neptuneDistance)
                    PlanetView(radius: 40, color: .blue)
                        .offset(x: neptuneDistance)
                        .rotationEffect(isAnimating ? Angle(degrees: neptuneStartingAngle + 360) : Angle(degrees: neptuneStartingAngle))
                        .animation(.linear(duration: 601.90)
                            .repeatForever(autoreverses: false), value: isAnimating)
                }
                
                
            }
            .scaleEffect(scale)
            .offset(x: position.width, y: position.height)
            
            
            
            VStack() {
                TextContentView(textString: "Try to move or zoom it!")
                    .opacity(opacityHint)
                    .animation(.easeIn(duration: 5), value: opacityHint)
                
                Spacer()
                
                TextContentView(textString: "This is our solar system. Have you met all planets? Our sun is the biggest star in this screen, located in the center. In order of proximity to it, we can now find Mercury (a bit rushed, don't you think?), Venus, Earth (where we live!), Mars, Jupiter, Saturn, Uranus and Neptune.")
                    .opacity(opacityTrivia)
                    .animation(.easeIn(duration: 2), value: opacityTrivia)
          
                
            }
            .padding(.horizontal, 50)
        }
        .gesture(
                   DragGesture()
                       .onChanged { value in
                           self.position = value.translation
                       }

               )
        .gesture(MagnificationGesture()
                    .onChanged { value in
                        self.scale = value.magnitude
                    })
        
      

        .onAppear {
            self.isAnimating = true
            
            opacityHint = 0
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                opacityTrivia = 1
            }
        }
    }
}



struct SolarSystem_Previews: PreviewProvider {
    static var previews: some View {
        SolarSystem()
    }
}
