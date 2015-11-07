//
//  Item.swift
//  iOSApp
//
//  Created by Matchima Ditthawibun on 11/7/2558 BE.
//  Copyright © 2558 Matchima Ditthawibun. All rights reserved.
//

import Foundation
import CoreLocation

protocol Item {
    var title : String {get}
    var location : CLLocationCoordinate2D {get}
    var date : String {get}
    var description : String {get}
    var type : String {get}
}