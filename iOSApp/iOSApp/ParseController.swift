//
//  ParseController.swift
//  iOSApp
//
//  Created by Matchima Ditthawibun on 11/8/2558 BE.
//  Copyright © 2558 Matchima Ditthawibun. All rights reserved.
//

import Foundation
import Parse
import Blots

class ParseController {
    func initParseDB(){
        
        var username: [String] = ["admin", "User1", "User2", "User3", "User4", "User5"]
        var password: [String] = ["1234","1111","2222","3333","4444","5555"]
        var email: [String] = ["admin@jmp", "User1@jmp", "User2@jmp", "User3@jmp", "User4@jmp", "User5@jmp"]
        var tel: [String] = ["1234","1111","2222","3333","4444","5555"]
        var location_lat: [String] = []
        var location_long: [String] = []
        
        vat post = PFObject(className: "Report")
        post["uploader"] = PFUser.currentUser()
        post["username"] = username[0]
        post["password"] = password[0]
        post["email"] = email[0]
        post["tel"] = tel[0]
        post["location_lat"] = location_lat[0]
        post["location_long"] = location_long[0]
        post["skill"] = skill[0]
        
        post.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success == true {
                print("Score created with ID: \(post.objectId)")
            } else {
                print(error)
            }
        }
        
        for(var i=0; i<6; i++){
            post["uploader"] = PFUser.currentUser()
            post["username"] = username[i]
            post["password"] = password[i]
            post["email"] = email[i]
            post["tel"] = tel[i]
            post["location_lat"] = location_lat[i]
            post["location_long"] = location_long[i]
            post["skill"] = skill[i]
            
            post.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                if success == true {
                    print("Score created with ID: \(post.objectId)")
                } else {
                    print(error)
                }
            }
        }
    }
    
    
    
}