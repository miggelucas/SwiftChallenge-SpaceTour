//
//  EarthSystem.swift
//  Tide Effect
//
//  Created by Lucas Migge de Barros on 02/04/23.
//

import SwiftUI

struct EarthSystem: View {
    let earthRadius: CGFloat = 50
    
    let moonRadius: CGFloat = 25
    let moonDistanceToEarth: CGFloat = 100
    @State var moonRevolutionPeriod: Double
    
    @State private var moonAngle: Angle = .degrees(0)

    var tidePeriod: Double
    
    var body: some View {
        ZStack {
            // Tide
            Tide(earthRadius: earthRadius + 5,
                 tideIntensityPeriod: tidePeriod)
                .rotationEffect(moonAngle, anchor: .center)
            
            // Earth
            PlanetView(radius: earthRadius,
                       color: .brown)
                .rotationEffect(moonAngle, anchor: .center)
            
            
            // Moon
            PlanetView(radius: moonRadius,
                       color: .gray)
                .offset(x: moonDistanceToEarth , y: 0)
                .rotationEffect(moonAngle, anchor: .center)
            
            
        }
        .padding()
        .onAppear {
            withAnimation(Animation.linear(duration: moonRevolutionPeriod).repeatForever(autoreverses: false)) {
                self.moonAngle = .degrees(360)
            }
        }
        
    }
}


struct EarthSystem_Previews: PreviewProvider {
    static var previews: some View {
        EarthSystem(moonRevolutionPeriod: 10, tidePeriod: 10)
    }
}
