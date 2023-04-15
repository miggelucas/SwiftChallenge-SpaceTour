//
//  Star.swift
//  Tide Effect
//
//  Created by Lucas Migge de Barros on 15/04/23.
//

import SwiftUI

struct StarView: View {
    @State var isAnimating: Bool
    
    
    init(isAnimating: Bool = false,
         starSize: CGFloat = CGFloat.random(in: 10...20),
         animationDuration: Double = Double.random(in: 2...10),
         starColorList: [Color] = [.cyan, .yellow, .orange, .blue, .brown, .white]) {
        self.isAnimating = isAnimating
        self.starSize = starSize
        self.starColor = starColorList.randomElement() ?? .white
        self.animationDuration = animationDuration
    }
    
    let starSize: CGFloat
    let starColor: Color
    let animationDuration: Double
    
    
    
    var body: some View {
        Group {
            Circle()
                .fill(starColor)
                .frame(width: starSize)
                .blur(radius: isAnimating ? 4 : 2)
                .scaleEffect(isAnimating ? 0.8 : 1)
            
        }
        
        .onAppear {
            withAnimation(Animation.easeInOut(duration: animationDuration).repeatForever()) {
                isAnimating = true
            }
        }
    }
    
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.black)
            VStack {
                StarView()
   
                
            }
        }
        
    }
}
