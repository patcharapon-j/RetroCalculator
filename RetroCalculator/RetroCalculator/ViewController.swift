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
        outputLabel.text = "\(sender.tag)"
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

