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
    
    var maxShadownOffset: CGFloat {
        return moonRadius + 1
    }
    
    var body: some View {
        ZStack {
            // moon
            PlanetView(radius: moonRadius,
                       color: .white)
            
            // moon light
            PlanetView(radius: moonRadius + 2,
                       color: .white)
            .blur(radius: 10)
            .opacity(isAnimating ? 0 : 1)

            
            // moon shadow
            PlanetView(radius: moonRadius,
                       color: .black)

            .offset(x: isAnimating ? 0 : maxShadownOffset)

        }
        .frame(width: moonRadius, height: moonRadius)
        .onAppear {
            withAnimation(.easeInOut(duration: moonPhasePeriod / 2).repeatForever()) {
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
