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
    let moonDistanceToEarth: CGFloat = 375
    var moonRevolutionPeriod: Double = 28
    
    @State var isAnimation: Bool = false
    @State private var scale: CGFloat = 1.0
    
    @State var opacityHint: Double = 1
    @State var opacityTrivia: Double = 0
    
    var body: some View {
        ZStack {
            
            // Space
            SpaceView(numberOfStars: 25)
            
            ZStack {
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
            .scaleEffect(scale)
            
            VStack() {
                TextContentView(textString: "Try to zoom it!")
                    .opacity(opacityHint)
                    .animation(.easeIn(duration: 5), value: opacityHint)
    
                Spacer()
                
                TextContentView(textString: "Tide is the rise and fall of sea level that happens every day. This happens because the moon, which is quite far from Earth, pulls sea water close to it with its gravitational pull. This causes the water to rise, causing high tide. Afterwards, the water goes back down, causing the low tide.")
                    .opacity(opacityTrivia)
                    .animation(.easeIn(duration: 2), value: opacityTrivia)
                    .padding()
                
            }
            .padding(.horizontal, 50)
        }
        .gesture(MagnificationGesture()
                    .onChanged { value in
                        self.scale = value.magnitude
                    })
        .onAppear {
            isAnimation = true
            
            opacityHint = 0
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                opacityTrivia = 1
            }
            
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
