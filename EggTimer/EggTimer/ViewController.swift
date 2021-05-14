//
//  ViewController.swift
//  EggTimer
//
//  Created by Guseyn on 19/04/2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var infoEggs: UILabel!
 
    @IBOutlet weak var progressView: UIProgressView!
    
    var eggs = ["Soft":3,"Medium":5,"Hard":7]
   
    var timer = Timer()
    var totalTime = 0
    var secondsPassed=0
    var player:AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        timer.invalidate()
        infoEggs.text=hardness
        progressView.progress=0.0
        secondsPassed=0
        
        totalTime = eggs[hardness]!
       
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
       
        
        }
        
    @objc func updateTimer(){
        if secondsPassed < totalTime{
            
            secondsPassed+=1
            
            progressView.progress=Float(secondsPassed) / Float(totalTime)
            
            
        }
        else{
            timer.invalidate()
            infoEggs.text="Done!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}
