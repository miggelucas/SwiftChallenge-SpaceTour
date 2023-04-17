//
//  TideSystem.swift
//  Tide Effect
//
//  Created by Lucas Migge de Barros on 02/04/23.
//

import SwiftUI

struct TideSystem: View {
    
    let earthRadius: CGFloat = 150
    let moonRadius: CGFloat = 50
    let moonDistanceToEarth: CGFloat = 400
    var moonRevolutionPeriod: Double = 28
    
    @State var isAnimation: Bool = false
    
    var body: some View {
        ZStack {
            
            // Space
            SpaceView(numberOfStars: 25)

            
            // Tide
            Tide(earthRadius: earthRadius + 5)
                .rotationEffect(isAnimation ? Angle(degrees: 360) : Angle(degrees: 0),
                                anchor: .center)
                .animation(.linear(duration: moonRevolutionPeriod)
                    .repeatForever(autoreverses: false), value: isAnimation)
            
            // Earth
            PlanetView(radius: earthRadius,
                       color: .brown)

            
            // Moon
            PlanetView(radius: moonRadius,
                       color: .gray)
                .offset(x: moonDistanceToEarth , y: 0)
                .rotationEffect(isAnimation ? Angle(degrees: 360) : Angle(degrees: 0),
                                anchor: .center)
                .animation(.linear(duration: moonRevolutionPeriod)
                    .repeatForever(autoreverses: false), value: isAnimation)
            
            
            Image(systemName: "sailboat")
                .resizable()
                .frame(width: 100.0, height: 100)
                .foregroundColor(.accentColor)
                .offset(y: isAnimation ? -150 : -120)
                .animation(.easeInOut(duration: moonRevolutionPeriod / 4)
                    .repeatForever(autoreverses: true), value: isAnimation)

            
        }
        .onAppear {
            isAnimation = true
            
        }
        .ignoresSafeArea()

        
    }
}


struct TideSystem_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
    
            // System
            TideSystem()
        }

    }
}
