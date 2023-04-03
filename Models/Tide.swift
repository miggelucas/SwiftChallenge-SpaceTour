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
    var tideIntensityPeriod: Double
    @State var tideWidth: CGFloat
    
    init(earthRadius: CGFloat, tideIntensityPeriod: Double) {
        self.earthRadius = earthRadius
        self.tideWidth = earthRadius * 1.5
        self.tideIntensityPeriod = tideIntensityPeriod
    }

    
    var body: some View {
        ZStack {
            Ellipse()
                .fill(tideColor)
                .frame(width: tideWidth,
                       height: earthRadius*1.05)
                .animation(.easeInOut(duration: tideIntensityPeriod - (tideIntensityPeriod / 2) ).repeatForever(autoreverses: true),
                           value: tideWidth)
        }
        
        .onAppear {
            self.tideWidth = earthRadius * 1.8
        }
    }
    
    
    
}




struct Tide_Previews: PreviewProvider {
    static var previews: some View {
        Tide(earthRadius: 50, tideIntensityPeriod: 1)
    }
}

