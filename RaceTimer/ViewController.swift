//
//  ViewController.swift
//  RaceTimer
//
//  Created by Diego dos Santos on 4/30/15.
//  Copyright (c) 2015 Diego dos Santos. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    var timer = NSTimer()
    var counter : Float = 0
    var lapTime : Float = 0
    var isRunning : Bool = false
    var race = NSMutableArray()
    let locationManager = CLLocationManager()
    var startLine = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.masksToBounds = true
        startButton.layer.cornerRadius = 50
        timeLabel.text = "00:00.000"
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func startPress(sender: UIButton) {
        if isRunning{
            performSegueWithIdentifier("saveSegue", sender: nil)
            startButton.backgroundColor = UIColor.grayColor()
            isRunning = false
            timer.invalidate()
            lapTime = 0
            counter = 0
            timeLabel.text = "00:00.000"
        } else {
            isRunning = true
            startButton.backgroundColor = UIColor.redColor()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.001, target:self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
            startLine = locationManager.location
        }
    }
    
 
    
    @IBAction func lapPress(sender: UIButton) {
        if isRunning{
            var time = stringFromTimeInterval(lapTime)
            race.addObject(time)
            lapTime = 0
        }
    }
    
    func updateCounter() {
        counter = counter + 0.001
        lapTime = lapTime + 0.001
        timeLabel.text = stringFromTimeInterval(counter) as? String
    }
    
    func stringFromTimeInterval(interval: Float) -> NSString {
        
        var ti = NSInteger(interval)
        
        var ms = Int((interval % 1) * 1000)
        
        var seconds = ti % 60
        var minutes = (ti / 60) % 60
        
        return String(format:"%0.2d:%0.2d.%0.3d",minutes,seconds,ms)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "saveSegue"{
            var dvc = segue.destinationViewController as! UINavigationController
            var svc = dvc.viewControllers[0] as! SaveViewController
            svc.times = race
        }
    }
}

