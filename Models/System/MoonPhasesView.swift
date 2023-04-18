//
//  SwiftUIView.swift
//  
//
//  Created by Lucas Migge de Barros on 17/04/23.
//

import SwiftUI

struct MoonPhasesView: View {
    @State var isAnimating: Bool = false
    var moonPhasePeriod: Double
    var moonRadius: CGFloat = 50
    
    var body: some View {
        ZStack {
            // moon
            PlanetView(radius: moonRadius,
                       color: .white)

//            .rotationEffect(angleRotation)
            
            
            // moon shadow
            PlanetView(radius: moonRadius,
                       color: .black)

            .offset(x: isAnimating ? -moonRadius : moonRadius)
//            .rotationEffect(angleRotation)
        }
        .frame(width: moonRadius, height: moonRadius)
        .onAppear {
            withAnimation(.linear(duration: moonPhasePeriod).repeatForever()) {
                isAnimating = true
            }
        }
    }
    
}

struct MoonPhasesView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.gray)
            MoonPhasesView(moonPhasePeriod: 28)
        }

    }
}
