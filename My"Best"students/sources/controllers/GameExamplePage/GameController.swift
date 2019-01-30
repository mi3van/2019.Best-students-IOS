//
//  GameController.swift
//  "Best" students
//
//  Created by Ivan Kuzmin on 29/01/2019.
//  Copyright © 2019 Example. All rights reserved.
//

import UIKit
import AVFoundation

class GameController: UIViewController {
    @IBOutlet weak var Label30: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var ButtonClick: UIButton!
    
    private var count: NSInteger = 0
    private var seconds: NSInteger = 10
    private var timer: Timer = Timer()
    
    private var buttonBeep: AVAudioPlayer = AVAudioPlayer();
    private var secondBeep: AVAudioPlayer = AVAudioPlayer();
    private var backgroundMusic: AVAudioPlayer = AVAudioPlayer();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonBeep = MusicHelper.setupAudioPlayer(withFile: "ButtonTap", type: "wav")!
        secondBeep = MusicHelper.setupAudioPlayer(withFile: "SecondBeep", type: "wav")!
        backgroundMusic = MusicHelper.setupAudioPlayer(withFile: "HallOfTheMountainKing", type: "mp3")!
        self.setupGame()
    }
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        count += 1
        self.updateTexts()
        buttonBeep.play()
    }
    
    private func setupGame() {
        backgroundMusic.volume = 0.3
        backgroundMusic.play()
        seconds = 10
        count = 0
        self.updateTexts()
        
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(subtractTime),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    private func updateTexts() {
        //        NSLocalizedString
        Label30.text = String(format: NSLocalizedString("time_title", comment: ""), seconds)
        ScoreLabel.text = String(format:  NSLocalizedString("score_title", comment: ""), count)
    }
    
    @objc func subtractTime() {
        seconds -= 1
        self.updateTexts()
        
        if (seconds == 0) {
            timer.invalidate()
            
            let alert = UIAlertController(title: "Time is up!", message: "You scored \(count) points", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Play again", style: .default) { (action:UIAlertAction) in
                self.setupGame();
            }
            alert.addAction(action1)
            self.present(alert, animated: true, completion: nil)
        }
        secondBeep.play()
    }
}
