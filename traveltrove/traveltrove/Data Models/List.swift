//
//  List.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/12/23.
//

import Foundation
import UIKit

struct List : Codable{
    var name: String
    var numItem: Int
    var totalVal: String
    
    init(name: String, numItem: Int, totalVal: String) {
        self.name = name
        self.numItem = numItem
        self.totalVal = totalVal
    }
    
}

//struct ListDec{
//    var name: String?
//    var numItem: Int?
//    var totalVal: String?
//
//    init(name: String?, numItem: Int?, totalVal: String?) {
//        self.name = name
//        self.numItem = numItem
//        self.totalVal = totalVal
//    }
//
//}

