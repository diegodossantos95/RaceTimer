//
//  SaveViewController.swift
//  RaceTimer
//
//  Created by Diego dos Santos on 5/3/15.
//  Copyright (c) 2015 Diego dos Santos. All rights reserved.
//

import UIKit

class SaveViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var times = NSMutableArray()
    var name = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCellWithIdentifier("nameCell") as! NameTableViewCell
            return cell
        }
        var cell = tableView.dequeueReusableCellWithIdentifier("timeCell") as! TimeTableViewCell
        cell.timeLabel.text = times[indexPath.row] as? String
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return times.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Name"
        }
        return "Times"
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    @IBAction func cancelPress(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func donePress(sender: UIBarButtonItem) {
        // save in coredata
        
    }
}
