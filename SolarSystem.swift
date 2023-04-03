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
            // Sum
            PlanetView(radius: 300, color: .yellow)
            
            // Mercury
            PlanetView(radius: 20, color: .indigo)
                .offset(x: 350)
            
            // Venus
            PlanetView(radius: 60, color: .yellow)
                .offset(x: 450)
            
            // Earth
            PlanetView(radius: 61, color: .blue)
                .offset(x: 500)
            
            // Mars
            PlanetView(radius: 30, color: .red)
            
            // Jupiter
            PlanetView(radius: 120, color: .orange)
            
            // Saturn
            PlanetView(radius: 110, color: .orange)
            
            // Uranos
            PlanetView(radius: 70, color: .cyan)
            
            // Neptune
            PlanetView(radius: 69, color: .blue)
            
            
        }
    }
}

struct SolarSystem_Previews: PreviewProvider {
    static var previews: some View {
        SolarSystem()
    }
}
