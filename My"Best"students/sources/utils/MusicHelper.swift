//
//  MusicHelper.swift
//  "Best" students
//
//  Created by Ivan Kuzmin on 29/01/2019.
//  Copyright © 2019 Example. All rights reserved.
//
import AVFoundation

class MusicHelper {
    static func setupAudioPlayer(withFile file: String?, type: String?) -> AVAudioPlayer? {
        let path = Bundle.main.path(forResource: file, ofType: type)
        let url = URL(fileURLWithPath: path ?? "")
        
        let audioPlayer = try? AVAudioPlayer(contentsOf: url)
        
        return audioPlayer
    }
}
