//
//  BeaconTableViewController.swift
//  regions
//
//  Created by Selim Salihovic on 03/04/15.
//  Copyright (c) 2015 NestHackers. All rights reserved.
//

import Foundation
import UIKit

class BeaconTableViewController : UITableViewController{
    
    @IBOutlet var beaconTableView: UITableView!

    var beacons : AnyObject = []
    
    override func viewDidLoad() {
       NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateView:", name: "updateBeaconTableView", object: nil)
        //listen for notifications with selector updateView
    }
    
    
    func updateView(note: NSNotification!){
        beacons = note.object!
        beaconTableView.reloadData() //update table data
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beacons.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("beaconCell", forIndexPath: indexPath) as UITableViewCell
        
        let major = beacons[indexPath.row].major as NSNumber
        var majorString = major.stringValue
        
        let minor = beacons[indexPath.row].minor as NSNumber
        var minorString = minor.stringValue
        
        let proximity = beacons[indexPath.row].proximity
        var proximityString = String()
        
        switch proximity!
        {
            case .Near:
                proximityString = "Near"
            case .Immediate:
                proximityString = "Immediate"
            case .Far:
                proximityString = "Far"
            case .Unknown:
                proximityString = "Unknown"
        }
        
        cell.textLabel?.text = "Major: \(majorString) Minor: \(minorString) Proximity: \(proximityString) "
        //display beacon values in cell text label
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Beacons in range"
    }

}
