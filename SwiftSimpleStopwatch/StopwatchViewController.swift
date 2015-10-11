//
//  StopwatchViewController.swift
//  Stopwatch
//
//  Created by Jasmine Lu on 10/10/15.
//  Copyright © 2015 Jasmine Lu. All rights reserved.
//

import UIKit

class StopwatchViewController: UIViewController {
    
    var startTime = NSTimeInterval()
    var timer = NSTimer()
    
    @IBOutlet weak var timeDisplayLabel: UILabel!
    
    @IBAction func go(sender: AnyObject) {if !timer.valid {
        let aSelector : Selector = "updateTime"
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate()
        }
    }
    
    @IBAction func stop(sender: AnyObject) {
        timer.invalidate()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        // calculate elapsed time
        var elapsedTime = currentTime - startTime
        
        // calculate elapsed minutes
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= NSTimeInterval(minutes) * 60.0
        
        // calculate elapsed seconds
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        // calculate elapsed milliseconds
        let milliseconds = UInt8(elapsedTime * 100)
        
        // add the leading zero for minutes, seconds and milliseconds and store them as string constants
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strMilliseconds = String(format: "%02d", milliseconds)
        
        // concatenate minutes, seconds and milliseconds and assign them to the UILabel
        timeDisplayLabel.text = "\(strMinutes):\(strSeconds):\(strMilliseconds)"
    }
}
