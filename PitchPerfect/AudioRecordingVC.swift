//
//  ViewController.swift
//  PitchPerfect
//
//  Created by osmanjan omar on 10/6/16.
//  Copyright © 2016 osmanjan omar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var TapToRecord: UILabel!
    @IBOutlet var RecordButtonOutlet: UIButton!
    @IBOutlet var StopRecordingButtonOutlet: UIButton!
    
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
}

