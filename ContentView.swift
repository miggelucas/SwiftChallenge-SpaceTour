//
//  ContentView.swift
//  Tide Effect
//
//  Created by Lucas Migge de Barros on 02/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            SpaceView(numberOfStars: 50)
//            EarthSystem(moonRevolutionPeriod: 6, tidePeriod: 6)
//            TideSystem()
            SolarSystem()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
