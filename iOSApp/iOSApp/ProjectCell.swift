//
//  itemCell.swift
//  iOSApp
//
//  Created by Matchima Ditthawibun on 11/7/2558 BE.
//  Copyright © 2558 Matchima Ditthawibun. All rights reserved.
//

import Foundation
import UIKit

class ProjectCell : UITableViewCell{
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblDescription: UILabel!

    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnStar: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layoutMargins = UIEdgeInsetsZero
        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.lblDescription.sizeToFit()
        //self.btnEdit.hidden = true
        self.btnStar.hidden = true
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}