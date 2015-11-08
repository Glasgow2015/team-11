//
//  RegisterVC.swift
//  iOSApp
//
//  Created by Matchima Ditthawibun on 11/8/2558 BE.
//  Copyright © 2558 Matchima Ditthawibun. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtTel: UITextField!
    @IBOutlet weak var txtLocation: UITextField!
    @IBOutlet weak var txtIn: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblHeader.backgroundColor = UIColor(red:0.02, green:0.57, blue:0.83, alpha:1.0)
    }
    
    @IBAction func btnRegister(sender: AnyObject) {
        var pc = ParseController();
        
            pc.addUser(txtUsername.text!, p: txtPassword.text!,e:txtEmail.text!,t:txtTel.text!,s:txtIn.text!,loc:txtLocation.text!);

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}