//
//  TestCoreMotionView.swift
//  SpaceTuor
//
//  Created by Lucas Migge de Barros on 22/05/23.
//

import SwiftUI
import CoreMotion

class MotionManager: ObservableObject {
    private let motionManager = CMMotionManager()
    
    @Published var x: Double
    @Published var y: Double
    
    init(x: Double = 0.0, y: Double = 0.0) {
        self.x = x
        self.y = y
        motionManager.deviceMotionUpdateInterval = 1 / 60
        
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
    
            guard let motion = data?.attitude else { return }
            
            self?.x = motion.roll
            self?.y = motion.pitch
            
        }
        
      
    }
    
}

struct TestCoreMotionView: View {
    
    @StateObject var motion = MotionManager()
    
    var body: some View {
        ZStack {
            SpaceView(numberOfStars: 25)
            
            Circle()
                .foregroundColor(.cyan)
                .frame(width: 50)
                .offset(x: motion.x * 20, y: motion.y * 20)
        }
     
        
    }
}

struct TestCoreMotionView_Previews: PreviewProvider {
    static var previews: some View {
        TestCoreMotionView()
    }
}
