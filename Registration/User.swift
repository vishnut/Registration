//
//  User.swift
//  Registration
//
//  Created by Vishnu Thiagarajan on 7/31/15.
//  Copyright © 2015 Vishnu Thiagarajan. All rights reserved.
//

import Foundation

class User:AnyObject{
    let name: String
    let email: String
    let phone: String
    let id: String
    let date: NSMutableArray
    
    init(nam:String, emai:String, pho:String, i:String, dat:NSMutableArray){
        name=nam
        email=emai
        phone=pho
        id=i
        date=dat
    }
    
    
}