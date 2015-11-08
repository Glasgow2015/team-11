//
//  userVC.swift
//  iOSApp
//
//  Created by Matchima Ditthawibun on 11/8/2558 BE.
//  Copyright © 2558 Matchima Ditthawibun. All rights reserved.
//

import UIKit

@objc protocol UserControllerDelegate: class{
    optional func removeUserView()
    optional func initAdminView()
    optional func initVolunteerView()
}

class UserVC: UIViewController {
    var delegate: UserControllerDelegate?
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    var user = User.shareInstance
    
    @IBAction func btnCancel(sender: AnyObject) {
        self.delegate?.removeUserView!()
    }
    
    @IBAction func btnLoginClicked(sender: AnyObject) {
        user.username = username.text!
        user.password = password.text!
        if (user.username == "admin"){
            self.delegate?.initAdminView!()
        }else{
            self.delegate?.initVolunteerView!()
        }
        self.delegate?.removeUserView!()
    }
    
    /*
    @IBAction func btnLogin(sender: AnyObject) {
        if(username.text == "admin"){
            
        }else{
            
        }
        self.delegate?.removeUserView!()
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnLogin.layer.cornerRadius = 4
        self.btnRegister.layer.cornerRadius = 4
        self.btnCancel.layer.cornerRadius = 4
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}