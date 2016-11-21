//
//  MusicHelper.swift
//  JustMyType
//
//  Created by Lauren Koulias on 11/20/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

//found at http://stackoverflow.com/questions/31422014/play-background-music-in-app/34693046#34693046

import Foundation
import AVFoundation

class MusicHelper {
    static let sharedHelper = MusicHelper()
    var audioPlayer: AVAudioPlayer?
    
    func playBackgroundMusic() {
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Chill", ofType: "wav")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            audioPlayer!.numberOfLoops = -1
            audioPlayer!.prepareToPlay()
            audioPlayer!.play()
        } catch {
            print("Cannot play the file")
        }
    }
    
    func pauseBackgroundMusic() {
        audioPlayer!.pause()
    }
    
    func resumeBackgroundMusic() {
        audioPlayer!.play()
    }
}
