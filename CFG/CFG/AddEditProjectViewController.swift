//
//  AddEditProjectViewController.swift
//  CFG
//
//  Created by Mananchai Rojamornkul on 11/7/2558 BE.
//  Copyright © 2558 Mananchai Rojamornkul. All rights reserved.
//

import UIKit

class AddEditProjectViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var des: UITextView!
    @IBOutlet weak var location: UITextField!
    
    @IBAction func cancelBtn(sender: AnyObject) {
    }
    @IBAction func saveBtn(sender: AnyObject) {
    }
    @IBAction func getImage(sender: AnyObject) {
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
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        var temp : UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = temp
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
