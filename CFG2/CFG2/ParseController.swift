//
//  ParseController.swift
//  CFG2
//
//  Created by Mananchai Rojamornkul on 11/7/2558 BE.
//  Copyright © 2558 Mananchai Rojamornkul. All rights reserved.
//

import Foundation
import Parse

@objc protocol ParseControllerDelegate: class{
    optional func finishLoading()
    optional func finishSaving()
}

class ParseController{
    /*
    var delegate: ParseControllerDelegate?
    
    func loadHome(){
        var query = PFQuery(className:"Home")
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if let error = error {
                // There was an error
            } else {
                //println(objects)
                for object in objects! {
                    var homeTitle: String = object["homeTitle"] as! String
                    var homeDescription : String = object["homeDescription"] as! String
                    //var home = Home(name: homeTitle, description: homeDescription, objectID: object.objectId!!)
                   // self.loadRoom(home)
                   // user.addHome(home)
                }
            }
        }
        
    }
    
    func loadRoom(){
        //let user = User.shareInstance
        //var roomQuery = PFQuery(className:"Room")
        
        //roomQuery.whereKey("homeID", equalTo: home.objectID)
       // roomQuery.findObjectsInBackgroundWithBlock{
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if let error = error {
                // There was an error
            } else {
                for eachRoom in objects!{
                    var roomTitle: String = eachRoom["roomTitle"] as! String
                    var roomDescription: String = eachRoom["roomDescription"] as! String
                    var room = Room(name: roomTitle, description: roomDescription, objectID: eachRoom.objectId!!)
                    self.loadAccessory(room)
                    home.addRoom(room)
                }
            }
        }
    }
    
    func loadAccessory(room: Room){
        var accQuery = PFQuery(className: "Accessory")
        
        accQuery.whereKey("roomID", equalTo: room.objectID)
        accQuery.findObjectsInBackgroundWithBlock{
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if let error = error {
                // There was an error
            } else {
                for eachAcc in objects!{
                    if (eachAcc["accessoryType"] as! String == "Light"){
                        self.loadLight(eachAcc["accessoryID"] as! String, room: room)
                    }else if (eachAcc["accessoryType"] as! String == "Plug"){
                        self.loadPlug(eachAcc["accessoryID"] as! String, room: room)
                    }
                }
            }
        }
    }
    
    private func loadLight(accID: String, room: Room){
        let user = User.shareInstance
        var lightQuery = PFQuery(className: "Light")
        lightQuery.whereKey("objectId", equalTo: accID)
        lightQuery.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if let error = error {
                // There was an error
            } else {
                //println(objects)
                for object in objects! {
                    var lightTitle: String = object["lightTitle"] as! String
                    var lightDesc: String = object["lightDescription"] as! String
                    
                    var light = Light(name: lightTitle, description: lightDesc, objectID: object.objectId!!)
                    room.addAccessory(light)
                }
                self.delegate?.finishLoading!()
            }
        }
        
    }
    
    private func loadPlug(accID: String, room: Room){
        let user = User.shareInstance
        var plugQuery = PFQuery(className: "Plug")
        plugQuery.whereKey("objectId", equalTo: accID)
        plugQuery.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if let error = error {
                // There was an error
            } else {
                for object in objects! {
                    var plugTitle: String = object["plugTitle"] as! String
                    var plugDescription: String = object["plugDescription"] as! String
                    
                    var plug = Plug(name: plugTitle, description: plugDescription, bleName: plugTitle, bleUUID: "", objectID : object.objectId!!)
                    
                    room.addAccessory(plug)
                }
                self.delegate?.finishLoading!()
            }
        }
        
    }
    
    
    func saveDataToParse(parseObj: PFObject, type: String){
        parseObj.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                if (type == "Home"){
                    let home = Home(name: parseObj["homeTitle"] as! String, description: parseObj["homeDescription"] as! String, objectID: parseObj.objectId!)
                    User.shareInstance.addHome(home)
                    User.shareInstance.setDefaultHomeByIndex(User.shareInstance.home.count-1)
                }else if (type == "Room"){
                    let room = Room(name: parseObj["roomTitle"] as! String, description: parseObj["roomDescription"] as! String, objectID: parseObj.objectId!)
                    User.shareInstance.mainHome!.addRoom(room)
                }else if (type == "Light"){
                    let light = Light(name: parseObj["lightTitle"] as! String, description: parseObj["lightDescription"] as! String, objectID: parseObj.objectId!)
                    self.selectedRoom!.addAccessory(light)
                    
                    var parseAccessory = PFObject(className:"Accessory")
                    parseAccessory["roomID"] = self.selectedRoom!.objectID
                    parseAccessory["accessoryType"] = "Light"
                    parseAccessory["accessoryID"] = parseObj.objectId!
                    
                    self.saveDataToParse(parseAccessory, type: "Accessory")
                }else if (type == "Plug"){
                    println("IN")
                    let plug = Plug(name: parseObj["plugTitle"] as! String, description: parseObj["plugDescription"] as! String, bleName: parseObj["bleName"] as! String, bleUUID: parseObj["bleUUID"] as! String, objectID: parseObj.objectId!)
                    plug.bleManager = self.selectedBLEManager
                    self.selectedRoom!.addAccessory(plug)
                    
                    var parseAccessory = PFObject(className:"Accessory")
                    parseAccessory["roomID"] = self.selectedRoom!.objectID
                    parseAccessory["accessoryType"] = "Plug"
                    parseAccessory["accessoryID"] = parseObj.objectId
                    
                    self.saveDataToParse(parseAccessory, type: "Accessory")
                }
                self.delegate?.finishSaving!()
            } else {
                println(error)
            }
        }
    }
    
    func addHome(homeTitle: String, homeDescription: String){
        var parseHome = PFObject(className:"Home")
        parseHome["homeTitle"] = homeTitle
        parseHome["homeDescription"] = homeDescription
        self.saveDataToParse(parseHome, type: "Home")
    }
    
    func addRoom(roomTitle: String, roomDescription: String, home: Home){
        var parseRoom = PFObject(className:"Room")
        parseRoom["homeID"] = home.objectID
        parseRoom["roomTitle"] = roomTitle
        parseRoom["roomDescription"] = roomDescription
        self.saveDataToParse(parseRoom, type: "Room")
    }
    
    func addLight(lightTitle: String, lightDescription: String, room: Room){
        self.selectedRoom = room
        var parseLight = PFObject(className:"Light")
        parseLight["lightTitle"] = lightTitle
        parseLight["lightDescription"] = lightDescription
        self.saveDataToParse(parseLight, type: "Light")
    }
    
    func addPlug(plugTitle: String, plugDescription: String, bleName: String, bleUUID: String, bleManager: BLEManager, room: Room){
        self.selectedRoom = room
        self.selectedBLEManager = bleManager
        var parsePlug = PFObject(className:"Plug")
        parsePlug["plugTitle"] = plugTitle
        parsePlug["plugDescription"] = plugDescription
        parsePlug["bleName"] = plugTitle
        parsePlug["bleUUID"] = bleUUID
        self.saveDataToParse(parsePlug, type: "Plug")
    }*/
}