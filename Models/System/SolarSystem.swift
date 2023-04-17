//
//  SolarSystem.swift
//  Tide Effect
//
//  Created by Lucas Migge de Barros on 03/04/23.
//

import SwiftUI

struct SolarSystem: View {
    @State var isAnimating: Bool = false
    
    
    // distance to sum
    let mercuryDistance: CGFloat = 65
    let venusDistance: CGFloat = 90
    let earthDistance: CGFloat = 120
    let marsDistance: CGFloat = 140
    let jupiterDistance: CGFloat = 240
    let saturnDistance: CGFloat = 370
    let uranosDistance: CGFloat = 430
    let neptuneDistance: CGFloat = 465
    
    var body: some View {
        ZStack {
            SpaceView(numberOfStars: 50)
            
            // Sum
            // planet but it's a star actually
            PlanetView(radius: 100, color: .yellow)
             
            // Mercury
            ZStack {
                OrbitalPathView(radius: mercuryDistance)
                PlanetView(radius: 5, color: .gray)
                    .offset(x: mercuryDistance)
                    .rotationEffect(isAnimating ? Angle(degrees: 360) : Angle(degrees: 0))
                    .animation(.linear(duration: 0.88)
                        .repeatForever(autoreverses: false), value: isAnimating)
            }
           
            
            // Venus
            ZStack {
                OrbitalPathView(radius: venusDistance)
                PlanetView(radius: 10, color: .yellow)
                    .offset(x: venusDistance)
                    .rotationEffect(isAnimating ? Angle(degrees: 380) : Angle(degrees: 20))
                    .animation(.linear(duration: 2.25)
                    .repeatForever(autoreverses: false), value: isAnimating)
            }
            
            // Earth
            ZStack {
                OrbitalPathView(radius: earthDistance)
                PlanetView(radius: 12, color: .blue)
                    .offset(x: earthDistance)
                    .rotationEffect(isAnimating ? Angle(degrees: 400) : Angle(degrees: 40))
                    .animation(.linear(duration: 3.65)
                    .repeatForever(autoreverses: false), value: isAnimating)
            }
            
            // Mars
            ZStack {
                OrbitalPathView(radius: marsDistance)
                PlanetView(radius: 6, color: .red)
                    .offset(x: marsDistance)
                    .rotationEffect(isAnimating ? Angle(degrees: 420) : Angle(degrees: 60))
                    .animation(.linear(duration: 6.87)
                    .repeatForever(autoreverses: false), value: isAnimating)
            }
            
            // Jupiter
            ZStack {
                OrbitalPathView(radius: jupiterDistance)
                PlanetView(radius: 60, color: .orange)
                    .offset(x: jupiterDistance)
                    .rotationEffect(isAnimating ? Angle(degrees: 440) : Angle(degrees: 80))
                    .animation(.linear(duration: 43.33)
                    .repeatForever(autoreverses: false), value: isAnimating)
            }
            
            // Saturn
            ZStack {
                OrbitalPathView(radius: saturnDistance)
                PlanetView(radius: 50, color: .orange)
                    .offset(x: saturnDistance)
                    .rotationEffect(isAnimating ? Angle(degrees: 520) : Angle(degrees: 160))
                    .animation(.linear(duration: 107.59)
                    .repeatForever(autoreverses: false), value: isAnimating)
            }
            
            // Uranos
            ZStack {
                OrbitalPathView(radius: uranosDistance)
                PlanetView(radius: 40, color: .cyan)
                    .offset(x: uranosDistance)
                    .rotationEffect(isAnimating ? Angle(degrees: 480) : Angle(degrees: 120))
                    .animation(.linear(duration: 306.87)
                    .repeatForever(autoreverses: false), value: isAnimating)
            }
            
            // Neptune
            ZStack {
                OrbitalPathView(radius: neptuneDistance)
                PlanetView(radius: 40, color: .blue)
                    .offset(x: neptuneDistance)
                    .rotationEffect(isAnimating ? Angle(degrees: 360) : Angle(degrees: 0))
                    .animation(.linear(duration: 601.90)
                    .repeatForever(autoreverses: false), value: isAnimating)
            }
            
            
        }
        .onAppear {
            self.isAnimating = true
        }
    }
}



struct SolarSystem_Previews: PreviewProvider {
    static var previews: some View {
        SolarSystem()
    }
}
