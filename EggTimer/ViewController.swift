//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes: [String: Float] = ["Soft": 0.1, "Medium": 7.0, "Hard": 12.0]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness: String! = sender.currentTitle
        
        var res: Float = eggTimes[hardness]! * 60.0
        let totalSec: Float = eggTimes[hardness]! * 60.0
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] (Timer) in
            if res > 0 {
                let remainInt: Int = Int(res)
                self?.titleLabel.text = "\(remainInt) sec remaining"

                self?.progressBar.setProgress(Float(res) / Float(totalSec), animated: true)
                res -= 1
            } else {
                self?.progressBar.setProgress(Float(res) / Float(totalSec), animated: true)
                self?.titleLabel.text = "Times up!!"
                self?.playAlarm()
                Timer.invalidate()
            }
        }
    }
    
    private func playAlarm() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
