//
//  User.swift
//  iOSApp
//
//  Created by Matchima Ditthawibun on 11/7/2558 BE.
//  Copyright © 2558 Matchima Ditthawibun. All rights reserved.
//

import Foundation
import CoreLocation

class User {
    
    class var shareInstance:User {
        struct Static {
            static var instance:User? = nil
            static var oneToken:dispatch_once_t = 0
        }
        dispatch_once(&Static.oneToken) {
            Static.instance = User()
        }
        return Static.instance!
    }
    
    var username : String = ""
    var password : String = ""
    var email : String = ""
    var tel : String = ""
    var userLocation : CLLocationCoordinate2D = CLLocationCoordinate2D()
    var userLevel : String = ""
    var item : [Item] = []
    func addItem(item:Item) {
        self.item.append(item)
    }
    
    
}
