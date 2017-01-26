//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Patcharapon Joksamut on 1/23/2560 BE.
//  Copyright © 2560 Patcharapon Joksamut. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    
    @IBOutlet weak var outputLabel: UILabel!
    
    var btnSound: AVAudioPlayer!
    var runningNumber = ""
    var leftNum:Double = 0.0
    var rightNum:Double = 0.0
    var result:Double = 0.0
    var sign = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do{
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        }
        catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    @IBAction func numberPressed(sender: UIButton){
        playSound()
        runningNumber += "\(sender.tag)"
        outputLabel.text = runningNumber
    }
    
    @IBAction func signPressed(sender: UIButton){
        playSound()
        
        switch sender.tag {
        case 0:
            if(sign != -1){
                rightNum = Double(runningNumber)!
                
                switch sign {
                case 1:
                    result = leftNum + rightNum
                case 2:
                    result = leftNum - rightNum
                case 3:
                    result = leftNum * rightNum
                case 4:
                    result = leftNum / rightNum
                default:
                    break
                }
                leftNum = result
                rightNum = 0.0
                sign = -1
                runningNumber = ""
                outputLabel.text = "\(result)"
            }
        default:
            sign = sender.tag
            if(runningNumber == ""){
                leftNum = result
            }
            else{
                leftNum = Double(runningNumber)!
            }
            runningNumber = ""
        }
        
    }
    
    @IBAction func clearPressed(_ sender: Any) {
        playSound()
        runningNumber = "0"
        result = 0
        sign = -1
        leftNum = 0
        rightNum = 0
    }
    
    func playSound(){
        if(btnSound.isPlaying){
            btnSound.stop()
        }
        btnSound.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

