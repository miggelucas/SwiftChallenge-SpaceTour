//
//  SolarSystem.swift
//  Tide Effect
//
//  Created by Lucas Migge de Barros on 03/04/23.
//

import SwiftUI

struct SolarSystem: View {
    
    var body: some View {
        ZStack {
            // Space
            Color(.black)
            
            // Sum
            PlanetView(radius: 100, color: .yellow)
            
            // Mercury
            PlanetView(radius: 5, color: .indigo)
                .offset(x: 65)
            
            // Venus
            PlanetView(radius: 10, color: .yellow)
                .offset(x: 90)
            
            // Earth
            PlanetView(radius: 12, color: .blue)
                .offset(x: 120)
            
            // Mars
            PlanetView(radius: 6, color: .red)
                .offset(x: 140)
            
            // Jupiter
            PlanetView(radius: 60, color: .orange)
                .offset(x: 210)
            
            // Saturn
            PlanetView(radius: 50, color: .orange)
                .offset(x: 270)
            
            // Uranos
            PlanetView(radius: 40, color: .cyan)
                .offset(x: 320)
            
            // Neptune
            PlanetView(radius: 40, color: .blue)
                .offset(x: 365)
            
            
        }
    }
}

struct SolarSystem_Previews: PreviewProvider {
    static var previews: some View {
        SolarSystem()
    }
}
