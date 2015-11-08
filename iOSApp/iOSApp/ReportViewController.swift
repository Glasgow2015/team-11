//
//  ReportViewController.swift
//  CFG
//
//  Created by Mananchai Rojamornkul on 11/7/2558 BE.
//  Copyright © 2558 Mananchai Rojamornkul. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ReportViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate,MKMapViewDelegate,CLLocationManagerDelegate {
    
    var loc:CLLocationCoordinate2D = CLLocationCoordinate2D()
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var lblBorder: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var location: UITextField!
    
    @IBAction func loadImage(sender: AnyObject) {
        let img = UIImagePickerController()
        img.delegate = self
        img.allowsEditing = false;
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            img.sourceType = UIImagePickerControllerSourceType.Camera
        }else{
            img.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        
        self.presentViewController(img, animated: true, completion: nil)
        
    }
    
    func initLocationMan(){
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
        loc =  CLLocationCoordinate2D()
        print("lat: \(loc.latitude) long:\(loc.longitude)")
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        loc = manager.location!.coordinate
        //print("lat: \(loc.latitude) long:\(loc.longitude)")
    }
    
   
    @IBAction func useCurrentLocation(sender: AnyObject) {
        
    }
    @IBAction func saveBtn(sender: AnyObject) {
        if(imageView.image != nil){
            let p = ParseController();
            p.addReport(imageView.image!,loc: loc,des: txtDescription.text);
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
        lblBorder.layer.borderWidth = 2.0
        txtDescription.layer.borderColor = UIColor.lightGrayColor().CGColor
        txtDescription.layer.borderWidth = 0.5
        txtDescription.layer.cornerRadius = 3
        
        self.title = "Report Vandalism"
        
        initLocationMan()
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
