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
    
    var RecordedAudioURL : NSURL!
    
    var audioFile : AVAudioFile!
    var audioEngine : AVAudioEngine!
    var audioPlayerNode : AVAudioPlayerNode!
    var stopTimer : Timer!
    
        
    @IBOutlet weak var Snail: UIButton!
    @IBOutlet weak var Rabbit: UIButton!
    @IBOutlet weak var chipmunk: UIButton!
    @IBOutlet weak var DarthVader: UIButton!
    @IBOutlet weak var reverb: UIButton!
    @IBOutlet weak var Echo: UIButton!
    @IBOutlet weak var Stop: UIButton!
    
    @IBOutlet weak var StopButton: UIButton!
    
    
    enum ButtonType :Int{
        case slow = 0, fast, chipmunk, vader, echo ,reverb
    }
    
    @IBAction func PlaySoundsForButton(sender : UIButton){
    
        print("Play Button pressed")
        
        switch (ButtonType(rawValue: sender.tag)!) {
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
    
    @IBAction func StopButtonPressed(sender : UIButton){
    
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
