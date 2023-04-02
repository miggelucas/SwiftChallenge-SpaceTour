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
    let moonRevolutionPeriod: Double
    
    @State private var moonAngle: Angle = .degrees(0)
    @Binding var tideIncrement: Double
    
    var body: some View {
        ZStack {
            // Tide
            Ellipse()
                .offset(x: -10, y: 0)
                .fill(Color.blue.opacity(0.3))
                .frame(width: earthRadius * tideIncrement,
                       height: earthRadius*1.05)
                .rotationEffect(moonAngle, anchor: .center)
            
            // Earth
            PlanetView(radius: earthRadius, color: .brown)
                .rotationEffect(moonAngle, anchor: .center)
            
            
            // Moon
            PlanetView(radius: moonRadius, color: .gray)
                .offset(x: moonDistanceToEarth * -1, y: 0)
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
        EarthSystem(moonRevolutionPeriod: 25, tideIncrement: .constant(1))
    }
}
