//
//  DifferentGroups.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/11/23.
//

import Foundation
import UIKit

struct DifferentGroups{
    var createdBy: String?
    var lists:[list]?
    
    init(createdBy: String?, lists: [list]?) {
        self.createdBy = createdBy
        self.lists = lists
    }
    
}

struct list {
    var name: String?
    var numItems: Int?
    var value: Double?
    
    init(name: String?, numItems: Int?, value: Double?) {
        self.name = name
        self.numItems = numItems
        self.value = value
    }
}
