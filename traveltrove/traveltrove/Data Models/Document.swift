//
//  Document.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/11/23.
//

import Foundation
import UIKit

struct Document : Codable {
    var title: String
    var note: String
    var images: [String]
    
    init(title: String, note: String, images: [String]) {
        self.title = title
        self.note = note
        self.images = images
    }
    
}
