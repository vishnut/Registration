//
//  ViewController.swift
//  Registration
//
//  Created by Vishnu Thiagarajan on 7/30/15.
//  Copyright © 2015 Vishnu Thiagarajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    let date:String = ((String)(NSDate())).substringWithRange(Range<String.Index>(start:((String)(NSDate())).startIndex, end: advance(((String)(NSDate())).endIndex, -15)))
    
    @IBAction func submit(sender: UIButton) {
        //print(date)
        if (id.text != ""){
            existinguser(id.text!)
            id.text = nil
        }
        
        else if (name.text != "" && email.text != "" && phone.text != "")
        {
            newUser(name.text!, emai: email.text!, pho: phone.text!)
            name.text = nil
            email.text = nil
            phone.text = nil
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func existinguser(uid: String){
        let storage: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        //var users:NSMutableDictionary = NSMutableDictionary()
        if(storage.objectForKey("ids") != nil)// && storage.objectForKey("ids")?.objectForKey("uid") != nil)
        {
            //users = storage.objectForKey("users") as! NSMutableDictionary
            if(storage.objectForKey("ids")?.objectForKey("uid") != nil){
            let user:NSMutableArray = storage.objectForKey(uid) as! NSMutableArray
            let usa:NSMutableArray = NSMutableArray()
            let da:NSMutableArray = user.objectAtIndex(4) as! NSMutableArray
            /*for (var idnum=0;idnum < da.count; idnum++){
                datea.addObject(da.objectAtIndex(idnum))
            }*/
            da.addObject(date)
            
            for (var idnum=0;idnum < user.count-1; idnum++){
                usa.addObject(user.objectAtIndex(idnum))
            }
            usa.addObject(da)
            
            storage.setObject(usa, forKey: uid)
            }
            else{
                newUser(uid, emai: "existingusermissing", pho: "9999")
            }
        }
        else{
            newUser(uid, emai: "existingusermissing", pho: "9999")
        }
    }
    
    func newUser(nam:String, emai:String, pho:String){
        let storage: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        //let users:NSMutableDictionary = NSMutableDictionary()
        let ids:NSMutableArray = NSMutableArray()
        /*if(storage.objectForKey("users") != nil)
        {
            users = storage.objectForKey("users") as! NSMutableDictionary
        }*/
        if(storage.objectForKey("ids") != nil)
        {
            let idar = storage.objectForKey("ids") as! NSMutableArray
            for (var idnum=0;idnum < idar.count; idnum++){
                ids.addObject(idar.objectAtIndex(idnum))
            }
        }
        
        let dat:NSMutableArray = NSMutableArray()
        dat.addObject(date)

        if(storage.objectForKey(nam) == nil)
        {
           // let user:User = User(nam: nam,emai: emai,pho: pho,i: nam,dat: dat)
            let user:NSMutableArray = [nam,emai,pho,nam,dat]
            print(user)
            storage.setObject(user, forKey: nam)
            ids.addObject(nam)
        }
        else
        {
            let user:NSMutableArray = [nam,emai,pho,pho,dat]
            print(user)
            storage.setObject(user, forKey: pho)
            ids.addObject(pho)
        }
        storage.setObject(ids, forKey: "ids")
        //storage.setObject(users, forKey: "users")

    }


}

