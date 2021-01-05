//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let s = "hello"
        let s2 = s.capitalized
        print(s2)
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
//    Dictionary
    let eggTimes=[
        "Soft": 300,
        "Medium": 420,
        "Hard": 720
    ]
    
    var timer=Timer()
    var totalTime=0
    var secondsPassed=0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness=sender.currentTitle!
        //sender.currentTitle不加驚嘆號前是optional，因為也許有些button沒有賦予currentTitle
        //加上驚嘆號告訴Xcode：經由人為的設計所有連結的button都會有currentTitle
        
        totalTime=eggTimes[hardness]!
        //eggTimes[hardness]不加驚嘆號前是optional，因為也許hardness丟了dictionary無法對應的參數（屆時會產生nil）
        //加上驚嘆號告訴Xcode：經由人為設計確保所有扔進去的hardness都是可對應的
        
        progressBar.progress=0.0
        secondsPassed=0
        titleLabel.text=hardness
        timer=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let precentageProgress=Float(secondsPassed) / Float(totalTime)
            progressBar.progress=precentageProgress
        }else{
            timer.invalidate()
            titleLabel.text="DONE!"
        }
    }
    
    
}
