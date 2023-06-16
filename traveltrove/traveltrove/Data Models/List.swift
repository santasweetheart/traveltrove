//
//  List.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/12/23.
//

import Foundation
import UIKit

struct List{
    var name: String?
    var createdBy: String?
    var numItem: Int?
    var totalVal: Double?
    
    init(name: String?, createdBy: String?, numItem: Int?, totalVal: Double?) {
        self.name = name
        self.createdBy = createdBy
        self.numItem = numItem
        self.totalVal = totalVal
    }
    
}

