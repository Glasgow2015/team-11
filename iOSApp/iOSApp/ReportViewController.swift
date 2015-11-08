//
//  ReportViewController.swift
//  CFG
//
//  Created by Mananchai Rojamornkul on 11/7/2558 BE.
//  Copyright © 2558 Mananchai Rojamornkul. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    @IBOutlet weak var lblBorder: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var location: UITextField!
    @IBAction func loadImage(sender: AnyObject) {
        var img = UIImagePickerController()
        img.delegate = self
        img.allowsEditing = false;
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            img.sourceType = UIImagePickerControllerSourceType.Camera
        }else{
            img.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        
        self.presentViewController(img, animated: true, completion: nil)
    }
    
   
    @IBAction func useCurrentLocation(sender: AnyObject) {
    }
    @IBAction func saveBtn(sender: AnyObject) {
        if(imageView.image != nil){
            /*
            let post = PFObject(className: "Report")
            var imageData = UIImagePNGRepresentation(self.imageView.image!)
            var parseImageFile = PFFile(name:"name",data: imageData!)
            post["imageFile"] = parseImageFile
            post.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                print("file has been saved.")
            }
            */
        }
    }
    @IBAction func cancelBtn(sender: AnyObject) {
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        var temp : UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = temp
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblBorder.layer.borderColor = UIColor.lightGrayColor().CGColor
        lblBorder.layer.borderWidth = 2.0;
        self.title = "Report Vandalism"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
