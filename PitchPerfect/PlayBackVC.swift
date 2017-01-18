//
//  PlayBackVC.swift
//  PitchPerfect
//
//  Created by osmanjan omar on 10/6/16.
//  Copyright © 2016 osmanjan omar. All rights reserved.
//

import UIKit
import AVFoundation

class PlayBackVC: UIViewController {
    
    var recordedAudioURL : NSURL!
    
    var audioFile : AVAudioFile!
    var audioEngine : AVAudioEngine!
    var audioPlayerNode : AVAudioPlayerNode!
    var stopTimer : Timer!
    
        
    @IBOutlet weak var snail: UIButton!
    @IBOutlet weak var rabbit: UIButton!
    @IBOutlet weak var chipmunk: UIButton!
    @IBOutlet weak var darthVader: UIButton!
    @IBOutlet weak var reverb: UIButton!
    @IBOutlet weak var echo: UIButton!
        
    @IBOutlet weak var stopButton: UIButton!
    
    
    enum buttonType :Int{
        case slow = 0, fast, chipmunk, vader, echo ,reverb
    }
    
    @IBAction func playSoundsForButton(sender : UIButton){
    
        print("Play Button pressed")
        
        switch (buttonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo:true)
        case .reverb:
            playSound(reverb:true)
        }
        
        configureUI(playState: .Playing)
    
    }
    
    @IBAction func stopButtonPressed(sender : UIButton){
    
        print("Stop Button pressed")
        
        stopAudio()
    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        configureUI(playState: .NotPlaying)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
