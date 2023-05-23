//
//  ContentView.swift
//  SpaceTuor
//
//  Created by Lucas Migge de Barros on 22/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var isAnimating: Bool = false
    @State var titleOpacity: Double = 0
    @State var buttonsOpacity: Double = 0
    
    var body: some View {
        
        ZStack {
            SpaceView()
            
            VStack(spacing: 200) {
                Spacer()
                
                Text("Space Tour")
//                    .opacity(titleOpacity)
//                    .animation(.easeOut(duration: 5), value: titleOpacity)
                    .font(.system(size: 100, weight: .heavy, design: .monospaced))
                    .foregroundColor(.accentColor)
                
                
                VStack(spacing: 50) {
                    NavigationLink {
                        SolarSystem()
                    } label: {
                        Text("Solar System")
                        
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
                .font(.system(size: 50, weight: .semibold))
//                .opacity(buttonsOpacity)
//                .animation(.easeOut(duration: 5), value: buttonsOpacity)
                
            }
            .padding(.bottom, 150)
            
            
        }
        .onAppear {
            
//            titleOpacity = 1
//            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
//                buttonsOpacity = 1
//            }
            
        }
        
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
