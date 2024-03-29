//
//  ViewController.swift
//  iOSApp
//
//  Created by Matchima Ditthawibun on 11/7/2558 BE.
//  Copyright © 2558 Matchima Ditthawibun. All rights reserved.
//

import Foundation
import UIKit



class ViewVC : UITableViewController, UserControllerDelegate{
    var user = User.shareInstance
    var userView: UserVC?
    
    @IBAction func btnUserClicked(sender: AnyObject) {
        showUserView()
    }
    
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
    
    // MARK: - TableView Function

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300
    }
    
    // MARK: - TableView Data Source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.user.item.count)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("showProject", sender: cell)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showProject" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! ProjectVC
            }
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CustomCell.Project.rawValue, forIndexPath: indexPath) as! ProjectCell
        cell.lblTitle.text = user.item[indexPath.row].title
        cell.lblDescription.text = (user.item[indexPath.row] as! Project).description
        cell.lblLocation.text = "Glasgow"
        return cell
    
    }
    
    func showUserView() {
        removeUserView()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        userView = storyboard.instantiateViewControllerWithIdentifier("Loading") as? UserVC
        userView!.view.frame = navigationController!.view.bounds
        userView!.delegate = self
        navigationController?.view.addSubview(userView!.view)
    }
    
    func removeUserView() {
        userView?.view.removeFromSuperview()
        userView = nil
    }
}