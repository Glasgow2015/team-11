//
//  ViewController.swift
//  CFG2
//
//  Created by Mananchai Rojamornkul on 11/7/2558 BE.
//  Copyright © 2558 Mananchai Rojamornkul. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(PFUser.currentUser())
        
        /*
        let testObject = PFObject(className: "Report")
        testObject["username"] = "Matchima"
        testObject["uploader"] = PFUser.currentUser()
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
        */
    }

    @IBAction func save(sender: AnyObject) {
      /*
        if(imageView.image != nil){
            let post = PFObject(className: "Report")
            var imageData = UIImagePNGRepresentation(self.imageView.image!)
            var parseImageFile = PFFile(name:"name",data: imageData!)
            post["imageFile"] = parseImageFile
            post.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                print("file has been saved.")
            }
        }
        */
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

