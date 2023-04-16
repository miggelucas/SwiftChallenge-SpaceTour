//
//  SolarSystem.swift
//  Tide Effect
//
//  Created by Lucas Migge de Barros on 03/04/23.
//

import SwiftUI

struct SolarSystem: View {
    @State var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            
            // Sum
            PlanetView(radius: 100, color: .yellow)
            
            // Mercury
            PlanetView(radius: 5, color: .gray)
                .offset(x: 65)
                .rotationEffect(isAnimating ? Angle(degrees: 360) : Angle(degrees: 0))
                .animation(.linear(duration: 0.88)
                    .repeatForever(autoreverses: false), value: isAnimating)
            
            // Venus
            PlanetView(radius: 10, color: .yellow)
                .offset(x: 90)
                .rotationEffect(isAnimating ? Angle(degrees: 380) : Angle(degrees: 20))
                .animation(.linear(duration: 2.25)
                    .repeatForever(autoreverses: false), value: isAnimating)
            
            // Earth
            PlanetView(radius: 12, color: .blue)
                .offset(x: 120)
                .rotationEffect(isAnimating ? Angle(degrees: 400) : Angle(degrees: 40))
                .animation(.linear(duration: 3.65)
                    .repeatForever(autoreverses: false), value: isAnimating)
            
            // Mars
            PlanetView(radius: 6, color: .red)
                .offset(x: 140)
                .rotationEffect(isAnimating ? Angle(degrees: 420) : Angle(degrees: 60))
                .animation(.linear(duration: 6.87)
                    .repeatForever(autoreverses: false), value: isAnimating)
            
            // Jupiter
            PlanetView(radius: 60, color: .orange)
                .offset(x: 210)
                .rotationEffect(isAnimating ? Angle(degrees: 440) : Angle(degrees: 80))
                .animation(.linear(duration: 43.33)
                    .repeatForever(autoreverses: false), value: isAnimating)
            
            // Saturn
            PlanetView(radius: 50, color: .orange)
                .offset(x: 270)
                .rotationEffect(isAnimating ? Angle(degrees: 520) : Angle(degrees: 160))
                .animation(.linear(duration: 107.59)
                    .repeatForever(autoreverses: false), value: isAnimating)
            
            // Uranos
            PlanetView(radius: 40, color: .cyan)
                .offset(x: 320)
                .rotationEffect(isAnimating ? Angle(degrees: 480) : Angle(degrees: 120))
                .animation(.linear(duration: 306.87)
                    .repeatForever(autoreverses: false), value: isAnimating)
            
            // Neptune
            PlanetView(radius: 40, color: .blue)
                .offset(x: 365)
                .rotationEffect(isAnimating ? Angle(degrees: 360) : Angle(degrees: 0))
                .animation(.linear(duration: 601.90)
                    .repeatForever(autoreverses: false), value: isAnimating)
            
            
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
