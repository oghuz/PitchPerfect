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

    @IBOutlet var TapToRecord: UILabel!
    @IBOutlet var RecordButtonOutlet: UIButton!
    @IBOutlet var StopRecordingButtonOutlet: UIButton!
    
    var RecordAudio : AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        StopRecordingButtonOutlet.isEnabled = false
    }

    @IBAction func RecordAudio(_ sender: AnyObject) {
        
        TapToRecord.text = "Recording"
        StopRecordingButtonOutlet.isEnabled = true
        RecordButtonOutlet.isEnabled = false
    }

    @IBAction func StopRecording(_ sender: AnyObject) {
        
        TapToRecord.text = "Tap to record"
        StopRecordingButtonOutlet.isEnabled = false
        RecordButtonOutlet.isEnabled = true
    }
    
    func AudioRecord(){
        
        
        let DocumentDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let recordedAudio = "RecordedAudio.wav"
        let pathArray = [DocumentDir, recordedAudio] as [Any]
        
        let FilePath = NSURL.fileURL(withPathComponents: pathArray as! [String])
        
        let AudioSession = AVAudioSession.sharedInstance()
        try! AudioSession.setCategory( AVAudioSessionCategoryPlayAndRecord)
        try! AudioSession.setActive(true)
        
        try! RecordAudio = AVAudioRecorder.init(url: FilePath!, settings: [:])
        
        RecordAudio.delegate = self
        RecordAudio.isMeteringEnabled = true
        RecordAudio.prepareToRecord()
        RecordAudio.record()
        
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag{
        
            self.performSegue(withIdentifier: "PlayBack", sender: RecordAudio.url)
            print("Did finish recoeding")
        
        }
        
        else{
            print("Error recording audio")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let PlaySoundsNavigationController = segue.destination as! UINavigationController
        let controller: PlayBackVC = PlaySoundsNavigationController.topViewController as! PlayBackVC
        let RecordedAudioURL = sender as! NSURL
        controller.RecordedAudioURL = RecordedAudioURL
        
    }
    
}

