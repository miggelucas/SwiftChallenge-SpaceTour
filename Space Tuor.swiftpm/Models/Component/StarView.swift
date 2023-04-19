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
         starSize: CGFloat = CGFloat.random(in: 1...20),
         animationDuration: Double = Double.random(in: 1...5),
         opacity: Double = Double.random(in: 0.5...1),
         starColorList: [Color] = [ .cyan, .blue, .yellow, .orange,
                                    .white, .white, .yellow, .orange,
                                    .white, .white, .yellow, .orange,
                                    .white, .white, .yellow, .orange,
                                    .red, .brown],
         scaleMin: Double = 0.8
    ) {
                                        self.isAnimating = isAnimating
                                        self.starSize = starSize
                                        self.starColor = starColorList.randomElement() ?? .white
                                        self.animationDuration = animationDuration
                                        self.opacity = opacity
        self.scaleMin = scaleMin
                                    }
    
    let starSize: CGFloat
    let starColor: Color
    let animationDuration: Double
    let opacity: Double
    let scaleMin: Double
    
    
    
    var body: some View {
        Group {
//            Circle()
            Image(systemName: "rhombus.fill")
//                .fill(starColor)
                .foregroundColor(starColor)
                .frame(width: starSize)
                .blur(radius: isAnimating ? 4 : 1.5)
                .scaleEffect(isAnimating ? scaleMin : 1)
                .opacity(isAnimating ? opacity + 0.2 : opacity)
            
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
