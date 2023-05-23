//
//  Tide.swift
//  
//
//  Created by Lucas Migge de Barros on 02/04/23.
//

import Foundation
import SwiftUI

struct Tide: View {
    
    let tideColor: Color = Color.blue.opacity(0.5)
    let earthRadius: CGFloat

    var tideWidth: CGFloat
    @State var isAnimating: Bool = false
    
    init(earthRadius: CGFloat) {
        self.earthRadius = earthRadius
        self.tideWidth = earthRadius * 1.5

    }

    
    var body: some View {
        ZStack {
            Ellipse()
                .fill(tideColor)
                .frame(width: tideWidth,
                       height: earthRadius*1.05)
        }
        
        .onAppear {
            self.isAnimating = true
        }
    }
    
    
    
}




struct Tide_Previews: PreviewProvider {
    static var previews: some View {
        Tide(earthRadius: 50)
    }
}

