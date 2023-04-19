//
//  SpaceView.swift
//  Tide Effect
//
//  Created by Lucas Migge de Barros on 03/04/23.
//

import SwiftUI

struct SpaceView: View {
    
    let numberOfStars: Int?
    
    init(numberOfStars: Int? = 100) {
        self.numberOfStars = numberOfStars
    }
    
    private func getRandomPosition() -> CGPoint {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let randomX = CGFloat.random(in: 0..<screenWidth)
        let randomY = CGFloat.random(in: 0..<screenHeight)
        
        return CGPoint(x: randomX, y: randomY)
    }

    
    var body: some View {
        ZStack {
            Color(.black)
            
            if let stars = numberOfStars {
                ForEach(0..<stars) { _ in
                    StarView()
                        .position(getRandomPosition())
                }
            }
          
        }
        
        .ignoresSafeArea()
    }
}

struct SpaceView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceView(numberOfStars: 500)
    }
}
