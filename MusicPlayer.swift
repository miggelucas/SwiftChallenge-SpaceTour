//
//  MusicPlayer.swift
//  Tide Effect
//
//  Created by Lucas Migge de Barros on 16/04/23.
//

import Foundation
import AVFoundation

class MusicPlayer {
    static let shared = MusicPlayer()
    var player: AVAudioPlayer?

    func play() {
        let url = Bundle.main.url(forResource: "music", withExtension: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .moviePlayback, options: .duckOthers)
            if let safeURL = url {
                player = try AVAudioPlayer(contentsOf: safeURL)
                player?.numberOfLoops = -1
                player?.play()
            }
           
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
