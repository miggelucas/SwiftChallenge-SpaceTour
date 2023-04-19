//
//  PlanetView.swift
//  Tide Effect
//
//  Created by Lucas Migge de Barros on 02/04/23.
//

import SwiftUI

struct PlanetView: View {
    let radius: CGFloat
    let color: Color
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: radius)
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(radius: 100, color: .red)
    }
}
