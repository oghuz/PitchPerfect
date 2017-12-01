//
//  ViewController.swift
//  PitchPerfect
//
//  Created by osmanjan omar on 10/6/16.
//  Copyright © 2016 osmanjan omar. All rights reserved.
//

import UIKit
import AVFoundation

class AudioRecordingVC: UIViewController, AVAudioRecorderDelegate{

    @IBOutlet var recordingStatus: UILabel!
    @IBOutlet var recordButtonOutlet: UIButton!
    @IBOutlet var stopRecordingButtonOutlet: UIButton!
    
    var recordAudio : AVAudioRecorder!
    let colors = [UIColor.white, .black, .green, .lightGray, .cyan]
    let audioSession = AVAudioSession.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       let randomIndex = Int(arc4random_uniform(UInt32(colors.count)))
        
        self.view.backgroundColor = colors[randomIndex]
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        stopRecordingButtonOutlet.isEnabled = false
    }

    @IBAction func recordAudio(_ sender: AnyObject) {
        
        self.audioRecord()
        self.setUpButtons(recording: true)
    }

    @IBAction func stopRecording(_ sender: AnyObject) {
        
        recordAudio.stop()
        self.setUpButtons(recording: false)
    }
    
    func setUpButtons(recording:Bool) {
        // button label change based on which button pressed
        recordingStatus.text = recording ? "Now Recording" : "Tap to Record"
        
        // enable and disable buttons
        recordButtonOutlet.isEnabled = !recording
        stopRecordingButtonOutlet.isEnabled = recording
        
    }
    
    func audioRecord(){
        
        
        let settings = [
            AVFormatIDKey : Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey : 12000,
            AVNumberOfChannelsKey : 1,
            AVEncoderAudioQualityKey:AVAudioQuality.max.rawValue
        ]
        
        let documentDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentPathMember = documentDir[0]
        let filePathName = documentPathMember.appendingPathComponent("RecordedAudio.m4a")
        
    
        
        try! audioSession.setCategory( AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        try! audioSession.setActive(true)
        try! recordAudio = AVAudioRecorder.init(url: filePathName, settings: settings)
       
        recordAudio.delegate = self
        recordAudio.isMeteringEnabled = true
        recordAudio.prepareToRecord()
        recordAudio.record()
        
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag{
        
            self.performSegue(withIdentifier: "PlayBack", sender: recordAudio.url)
            print("Did finish recoeding")
        
        }
        
        else{
            print("Error recording audio")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let playAudioBack = segue.destination as! PlayBackVC
        
        let recordedAudioURL = sender as! NSURL
        playAudioBack.recordedAudioURL = recordedAudioURL
    }
    
}









