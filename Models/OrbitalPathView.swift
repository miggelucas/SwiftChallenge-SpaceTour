//
//  OrbitalPathView.swift
//  Tide Effect
//
//  Created by Lucas Migge de Barros on 16/04/23.
//

import SwiftUI

struct OrbitalPathView: View {
    let color: Color
    let opacity: Double
    let diameter: CGFloat
    
    init(color: Color = .white,
         opacity: Double = 0.4,
         radius: CGFloat) {
        self.color = color
        self.opacity = opacity
        self.diameter = radius * 2
    }
    
       
       var body: some View {
           Circle()
               //.strokeBorder(lineWidth: 1)
               .stroke(style: StrokeStyle(lineWidth: 1, dash: [5, 10]))
               .foregroundColor(color)
               .opacity(opacity)
               .frame(width: diameter)
     
       }
}

struct OrbitalPathView_Previews: PreviewProvider {
    static var previews: some View {
        OrbitalPathView(radius: 100)
    }
}
