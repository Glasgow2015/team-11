//
//  ProjectVC.swift
//  iOSApp
//
//  Created by Matchima Ditthawibun on 11/8/2558 BE.
//  Copyright © 2558 Matchima Ditthawibun. All rights reserved.
//

import UIKit

class ProjectVC : UITableViewController{
    var user = User.shareInstance

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleView = UIImageView(image: UIImage(named: "logo.png"))
        self.navigationItem.titleView = titleView
        tableView.registerNib(UINib(nibName: CustomCell.Project.rawValue, bundle: nil), forCellReuseIdentifier: CustomCell.Project.rawValue)
        tableView.layoutMargins = UIEdgeInsetsZero
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - TableView Data Source

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.user.adminItem.count)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        user.adminItem.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
    
}