//
//  ParseController.swift
//  iOSApp
//
//  Created by Matchima Ditthawibun on 11/8/2558 BE.
//  Copyright © 2558 Matchima Ditthawibun. All rights reserved.
//

import Foundation
import Parse
import Bolts

@objc protocol ParseControllerDelegate: class{
    optional func finishLoading()
    optional func finishSaving()
}

extension UIImage {
    var lowQualityJPEGNSData:NSData     { return UIImageJPEGRepresentation(self, 0.25)!}
    var lowestQualityJPEGNSData:NSData  { return UIImageJPEGRepresentation(self, 0.0)! }
}


/*

https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=YOUR_API_KEY


*/

class ParseController {
    
    var delegate : ParseControllerDelegate?
    lazy var data = NSMutableData()
    
    func work(){
        //addressToLatLong("Glasgow");
    }
    
    
    func addReport(img:UIImage,loc:CLLocationCoordinate2D,des:String){
        let post = PFObject(className: "Report")
        var imageData = img.lowestQualityJPEGNSData // UIImagePNGRepresentation(self.imageView.image.!)
        var parseImageFile = PFFile(name:"name",data: imageData)
        //post["uploader"] = PFUser.currentUser()
        post["imageFile"] = parseImageFile
        post["description"] = des
        post["location_lat"] = String(loc.latitude) // as! String
        post["location_long"] = String(loc.longitude) //as! String
        
        post.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success == true {
                print("Score created with ID: \(post.objectId)")
            } else {
                print("EEEEEEEEE\(error)")
            }
        }
    }
    
    func addProject(img: UIImage, des: String, loc: CLLocationCoordinate2D){
        let post = PFObject(className: "Project")
        var imageData = img.lowestQualityJPEGNSData // UIImagePNGRepresentation(self.imageView.image.!)
        var parseImageFile = PFFile(name:"name",data: imageData)
        //post["uploader"] = PFUser.currentUser()
        post["imageFile"] = parseImageFile
        post["description"] = des
        post["location_lat"] = String(loc.latitude) // as! String
        post["location_long"] = String(loc.longitude) //as! String
        post["skill"] = "gardening"
        
        post.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success == true {
                print("Score created with ID: \(post.objectId)")
            } else {
                print("EEEEEEEEE\(error)")
            }
        }
    }
    
    func loadProject(){
        let user = User.shareInstance
        var query = PFQuery(className:"Project")
        
        let prj = Project(title:"Green Campus", date : "01/01/2000", description : "Better environment for campus", lat : "0.00", long : "0.00")
        let prj2 = Project(title:"Code for good", date : "01/01/2000", description : "Better environment for campus", lat : "0.00", long : "0.00")
        user.addItem(prj)
        user.addItem(prj2)
        user.addAdminItem(prj)
        
        
        
        
        
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if let error = error {
                // There was an error
            } else {
                //println(objects)
                for object in objects! {
                    var des: String = object["description"] as! String
                    var latitude : String = object["location_lat"] as! String
                    var longtitude : String = object["location_long"] as! String
                    var d = "07/11/2015"
                    var home = Project(title: t, date: d, description: des, lat: latitude, long: longtitude)
                    self.loadRoom(home)
                    user.addHome(home)
                }
                self.delegate?.finishLoading!()
            }
        }
        
    }
    
    
    
    
    
    func addressToLatLong(add:String){
        //Set Connection
        let urlPath: String = "https://maps.googleapis.com/maps/api/geocode/json?address="+add+"&key=AIzaSyDbDLN56JRj40Qehy69R7Zo4bLKCD8GksE"
        //"http://5.9.41.204/help"
        //print(urlPath);
        let url: NSURL = NSURL(string: urlPath)!
        let request: NSURLRequest = NSURLRequest(URL: url)
        let connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
        connection.start()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
        print(data)
        //self.parseFromData(data)
    }
    
    
    func parseFromData(data : NSData) -> Void{
        
        var json : NSDictionary!
        do {
            json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
        } catch _ {
            print("Error")
        }
        
        
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        
        // throwing an error on the line below (can't figure out where the error message is)
        var jsonResult : NSDictionary!
        do {
            jsonResult = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
        } catch _ {
            print("Error")
        }
        
        //print(jsonResult["Help"])
        
        let results = jsonResult["Help"] as! [NSDictionary]
        
        for result in results {
            let intID : Int = result["id"] as! Int
            
            //let card : Card = Card(text: result["text"] as! String, id: intID, userToken: user.token)
            //ac.append(card)
        }
    }
    
    
    
    
    func addUser(u:String,p:String,e:String,t:String,s:String,loc:String){
    
        var post = PFObject(className: "User")
        
        
        post["username"] = u
        post["password"] = p
        post["email"] = e
        post["tel"] = t
        post["location_lat"] = String(55.861935)
        post["location_long"] = String(-4.245529)
        post["skill"] = s
        
        post.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success == true {
                print("Score created with ID: \(post.objectId)")
            } else {
                print(error)
            }
        }
    }
    
    
    
    
    
    func initUsers(){
        
        var username: [String] = ["admin", "User1", "User2", "User3", "User4", "User5"]
        var password: [String] = ["1234","1111","2222","3333","4444","5555"]
        var email: [String] = ["admin@jmp", "User1@jmp", "User2@jmp", "User3@jmp", "User4@jmp", "User5@jmp"]
        var tel: [String] = ["1234","1111","2222","3333","4444","5555"]
        var location_lat: [String] = ["0","55.864237","55.860333","55.872687","55.888309","55.878103"]
        var location_long: [String] = ["0","-4.251806","-4.261193","-4.288960","-4.250851","-4.337711"]
        var skill: [String] = ["I'm admin","gardening","painting","mechanical","gardening","gardening"]
        
        var post = PFObject(className: "User")
        
       
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
        
        /*
        post["username"] = username[1]
        post["password"] = password[1]
        post["email"] = email[1]
        post["tel"] = tel[1]
        post["location_lat"] = location_lat[1]
        post["location_long"] = location_long[1]
        post["skill"] = skill[1]
        
        post.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success == true {
                print("Score created with ID: \(post.objectId)")
            } else {
                print(error)
            }
        }
        */

        /*
        for(var i=0; i<6; i++){
            //post["uploader"] = PFUser.currentUser()
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
        */
    }
    
    
    
    
    
    
    
    
    
    
    
    func test(){
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
    }
    
}