//
//  Projects.swift
//  iOSApp
//
//  Created by Matchima Ditthawibun on 11/7/2558 BE.
//  Copyright © 2558 Matchima Ditthawibun. All rights reserved.
//

import Foundation
import Foundation
import CoreLocation

class Project : Item{
    
    var title : String = ""
    var location : CLLocationCoordinate2D = CLLocationCoordinate2D()
    var type : String = "Project"
    var date : String = ""
    var description : String = ""
    var user = User.shareInstance
    
    
    init (title : String, date : String, description : String, lat : String, long : String){
        self.title = title
        if(lat == "" || long == ""){
            self.location = CLLocationCoordinate2D(latitude: 0.00, longitude: 0.00)
        }else{
            self.location = CLLocationCoordinate2D(latitude: Double(lat)!, longitude: Double(long)!)
        }
        self.date = date
        self.description = description
    }
}
