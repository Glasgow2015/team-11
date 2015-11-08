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
    var titleHeader : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titleHeader
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        //let titleView = UIImageView(image: UIImage(named: "logo.png"))
        //self.navigationItem.titleView = titleView
        tableView.layoutMargins = UIEdgeInsetsZero
    }
    
    func insertNewObject(sender: AnyObject) {
        let prj = Project(title:"Green Campus", date : "01/01/2000", description : "Better environment for campus", lat : "0.00", long : "0.00")
        user.addAdminItem(prj)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
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