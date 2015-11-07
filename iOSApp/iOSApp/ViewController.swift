//
//  ViewController.swift
//  iOSApp
//
//  Created by Matchima Ditthawibun on 11/7/2558 BE.
//  Copyright © 2558 Matchima Ditthawibun. All rights reserved.
//

import Foundation
import UIKit

class ViewVC : UITableViewController{
    lazy var data = NSMutableData()
    var objects = [AnyObject]()
    var user = User.shareInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user.item = []
        //////////////////////////////////////////////////////////////////

        //Set tableView data
        tableView.estimatedRowHeight = 10
        tableView.sectionHeaderHeight = 90
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.registerNib(UINib(nibName: CustomCell.Level.rawValue, bundle: nil), forCellReuseIdentifier: CustomCell.Level.rawValue)
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
        return 380
        
    }
    
    // MARK: - TableView Data Source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.user.item.count)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellType = user.item[indexPath.row]
        switch CellType(rawValue: cellType.type)!{
        case .Item:
            let cell = tableView.dequeueReusableCellWithIdentifier(CustomCell.Map.rawValue, forIndexPath: indexPath) as! MapCell
            cell.delegate = self
            return cell
        case .Level:
            let cell = tableView.dequeueReusableCellWithIdentifier(CustomCell.Level.rawValue, forIndexPath: indexPath) as! LevelCell
            cell.lblTitle.text = user.item[indexPath.row].title
            cell.lblDescription.text = (user.item[indexPath.row] as! Level).description
            cell.lblReTweet.text = String((user.item[indexPath.row] as! Level).retweet)
            cell.lblDistance.text = String((user.item[indexPath.row] as! Level).distance)
            cell.backgroundColor = self.colorList[indexPath.row]
            
            return cell
        }
    }
    
    
    // MARK: - Loading view
    func showLoadingViewWithText(text:String) {
        removeLoadingView()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        loadingView = storyboard.instantiateViewControllerWithIdentifier("Loading") as? LoadingVC
        loadingView!.view.frame = navigationController!.view.bounds
        navigationController?.view.addSubview(loadingView!.view)
        loadingView!.loadingLabel?.text = text
    }
    
    func removeLoadingView() {
        loadingView?.view.removeFromSuperview()
        loadingView = nil
    }
    
    
}
