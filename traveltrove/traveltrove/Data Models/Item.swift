//
//  Item.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/12/23.
//

import Foundation

struct Item: Codable{
    var name: String
    var totalVal: Double
    var check: Bool
    
    init(name: String, totalVal: Double, check: Bool) {
        self.name = name
        self.totalVal = totalVal
        self.check = check
    }
    
}

