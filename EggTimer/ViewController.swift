//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes: [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness: String! = sender.currentTitle
        
        var res = eggTimes[hardness]!
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] (Timer) in
            if res > 0 {
                self?.titleLabel.text = "\(res) sec remaining"
                res -= 1
            } else {
                self?.titleLabel.text = "Times up!!"
                Timer.invalidate()
            }
        }
        
    }
}
