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
    
    init(name: String, totalVal: Double) {
        self.name = name
        self.totalVal = totalVal
    }
    
}

