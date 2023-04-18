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
                
                VStack(spacing: 200) {
                    Spacer()
                    
                    Text("Space Tour")
//                        .font(.system(,size: 70))
                        .font(.custom("American Typewriter", size: 150))
                        .fontWeight(.black)
                        .foregroundColor(.accentColor)
                    
                    VStack(spacing: 30) {
                        NavigationLink {
                            SolarSystem()
                        } label: {
                            Text("Solar System")
                                .font(.custom("Courier New", size: 50))
                                .padding(.horizontal, 50)
                                .padding(.vertical)
                                .background(.orange)
                                .cornerRadius(50)
                                .foregroundColor(.black)
                        }
                        
                        NavigationLink {
                            TideSystem()
                        } label: {
                            Text("Tide System")
                                .font(.custom("Courier New", size: 50))
                                .padding(.horizontal, 50)
                                .padding(.vertical)
                                .background(.orange)
                                .cornerRadius(50)
                                .foregroundColor(.black)
                        }
                        
                        NavigationLink {
                            MoonSystem()
                        } label: {
                            Text("Moon System")
                                .font(.custom("Courier New", size: 50))
                                .padding(.horizontal, 50)
                                .padding(.vertical)
                                .background(.orange)
                                .cornerRadius(50)
                                .foregroundColor(.black)
                        }
                        
                    }
                    
                }
                .padding(.bottom, 150)
                
                
            }
        }
        .onAppear {
            MusicPlayer.shared.play()
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
