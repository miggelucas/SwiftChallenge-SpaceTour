//
//  ContentView.swift
//  Tide Effect
//
//  Created by Lucas Migge de Barros on 02/04/23.
//

import SwiftUI

struct ContentView: View {

    
    var body: some View {
        NavigationStack {
            ZStack {
                    SpaceView()
                    
                    VStack(spacing: 60) {
                        Spacer()
                        
                        Text("Space Tour")
                            .font(.system(size: 70))
                            .fontWeight(.black)
                      
                        VStack(spacing: 30) {
                            NavigationLink {
                                SolarSystem()
                            } label: {
                                Text("Solar System")
                            }

                            NavigationLink {
                                TideSystem()
                            } label: {
                                Text("Tide System")
                            }

                            NavigationLink {
                                MoonSystem()
                            } label: {
                                Text("Moon system")
                            }
                    
                        }
                        .font(.system(size: 50))
        
                    }
                    .padding(.bottom, 300)
                    .foregroundColor(.accentColor)

            }
        }

        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
