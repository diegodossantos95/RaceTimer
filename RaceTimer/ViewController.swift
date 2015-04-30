//
//  ViewController.swift
//  RaceTimer
//
//  Created by Diego dos Santos on 4/30/15.
//  Copyright (c) 2015 Diego dos Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    var timer = NSTimer()
    var counter : Float = 0
    var isRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 50
        timeLabel.text = "0"//String(counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startPress(sender: UIButton) {
        if isRunning{
            button.backgroundColor = UIColor.grayColor()
            isRunning = false
            timer.invalidate()
        } else {
            isRunning = true
            button.backgroundColor = UIColor.redColor()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.001, target:self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
        }
    }
    
    func updateCounter() {
        counter = counter + 0.001
        timeLabel.text = stringFromTimeInterval(counter) as? String//String(format: "%0.03f", counter)////String(counter++)
    }
    
    func stringFromTimeInterval(interval: Float) -> NSString {
        
        var ti = NSInteger(interval)
        
        var ms = Int((interval % 1) * 1000)
        
        var seconds = ti % 60
        var minutes = (ti / 60) % 60
        //var hours = (ti / 3600)
        
        return String(format:"%0.2d:%0.2d.%0.3d",minutes,seconds,ms) //"%0.2d:%0.2d:%0.2d.%0.3d",hours,minutes,seconds,ms)
    }

}

