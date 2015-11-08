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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblHeader.backgroundColor = UIColor(red:0.02, green:0.57, blue:0.83, alpha:1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}