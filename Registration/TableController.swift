//
//  TableController.swift
//  Registration
//
//  Created by Vishnu Thiagarajan on 7/31/15.
//  Copyright © 2015 Vishnu Thiagarajan. All rights reserved.
//

import Foundation
import UIKit

class TableController: UITableViewController{
    
    //var users:NSMutableDictionary = NSMutableDictionary()
    var ids:NSMutableArray = NSMutableArray()
    let storage: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*let storage: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        if(storage.objectForKey("users") != nil)
        {
            users = storage.objectForKey("users") as! NSMutableDictionary
        }*/
        if(storage.objectForKey("ids") != nil)
        {
            ids = storage.objectForKey("ids") as! NSMutableArray
        }
        // Reload the table
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ids.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //ask for a reusable cell from the tableview, the tableview will create a new one if it doesn't have any
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel!.numberOfLines = 4
        // Get the corresponding candy from our candies array
        let user:NSMutableArray = self.storage.objectForKey(self.ids[indexPath.row] as! String) as! NSMutableArray
        
        // Configure the cell
        if(user.count > 1){
            print(user.count)
            print(user)
            cell.textLabel!.text = "Name: " + (user.objectAtIndex(0) as! String) + "\nEmail: " + (user.objectAtIndex(1) as! String) + "\nPhone: " + (user.objectAtIndex(2) as! String) + "\nDate: "
            let dates: NSMutableArray = user.objectAtIndex(4) as! NSMutableArray
            for(var de = 0; de < dates.count; de++){
                cell.textLabel!.text = cell.textLabel!.text! + (dates.objectAtIndex(de) as? String)! + " "
            }
            
            
            //cell.textLabel!.text += (user.objectAtIndex(4) as! NSMutableArray)

        }
        else{
            cell.textLabel!.text = "Nothing to see here"
        }
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    
    
}