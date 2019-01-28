//
//  ViewController.swift
//  My"Best"students
//
//  Created by Ivan Kuzmin on 23/01/2019.
//  Copyright © 2019 Example. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Label30: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var ButtonClick: UIButton!
    
    private var count: NSInteger = 0
    private var seconds: NSInteger = 10
    private var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGame()
    }
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        count += 1
        self.updateTexts()
    }

    private func setupGame() {
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
    }
}

