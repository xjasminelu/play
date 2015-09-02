//
//  StopwatchViewController.swift
//  SwiftSimpleStopwatch
//
//  Created by Scotty Shaw on 9/2/15.
//  Copyright (c) 2015 ___sks6___. All rights reserved.
//

import UIKit

class StopwatchViewController: UIViewController {
    
    var startTime = NSTimeInterval()
    var timer = NSTimer()
    
    @IBOutlet var timeDisplayLabel: UILabel!
    
    @IBAction func start(sender: AnyObject) {
        if !timer.valid {
            let aSelector : Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()
        }
    }
    
    @IBAction func stop (sender: AnyObject) {
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
        var currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        // calculate elapsed time
        var elapsedTime: NSTimeInterval = currentTime - startTime
        
        // calculate elapsed minutes
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (NSTimeInterval(minutes) * 60.0)
        
        // calculate elapsed seconds
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        // calculate the fraction of milliseconds to be displayed
        let fraction = UInt8(elapsedTime * 100)
        
        // add the leading zero for minutes, seconds and millseconds and store them as string constants
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strFraction = String(format: "%02d", fraction)
        
        // concatenate minutes, seconds and milliseconds and assign them to the UILabel
        timeDisplayLabel.text = "\(strMinutes):\(strSeconds):\(strFraction)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
