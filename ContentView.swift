//
//  ContentView.swift
//  Tide Effect
//
//  Created by Lucas Migge de Barros on 02/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var isAnimating: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                SpaceView()
                
                VStack(spacing: 200) {
                    Spacer()
                    
                    Text("Space Tour")
//                        .opacity(isAnimating ? 1 : 0)
                        .font(.system(size: 100, weight: .heavy, design: .monospaced))
                        .fontWeight(.black)
                        .foregroundColor(.accentColor)
                        
                    
                    VStack(spacing: 50) {
                        NavigationLink {
                            SolarSystem()
                        } label: {
                            Text("Solar System")
                                .font(.system(size: 50, weight: .semibold))
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
                                .font(.system(size: 50, weight: .semibold))
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
                                .font(.system(size: 50, weight: .semibold))
                                .padding(.horizontal, 50)
                                .padding(.vertical)
                                .background(.orange)
                                .cornerRadius(50)
                                .foregroundColor(.black)
                        }
                        
                    }
//                    .opacity(isAnimating ? 0 : 1)
                    
                }
                .padding(.bottom, 150)
                
                
            }
        }
        .onAppear {
            MusicPlayer.shared.play()
            withAnimation(.easeOut(duration: 5)) {
                isAnimating = true
            }
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
