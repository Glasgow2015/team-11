//
//  RegisterViewController.swift
//  CFG
//
//  Created by Mananchai Rojamornkul on 11/7/2558 BE.
//  Copyright © 2558 Mananchai Rojamornkul. All rights reserved.
//

import UIKit
import CoreLocation


class RegisterViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var conPassword: UITextField!
    @IBOutlet weak var tel: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var interest: UITextField!
    
    @IBOutlet weak var regBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    @IBAction func register_click(sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
