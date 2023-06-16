//
//  Document.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/11/23.
//

import Foundation
import UIKit

struct Document{
    var title: String?
    var note: String?
    var image: UIImage?
    
    init(title: String?, note: String?, image: UIImage?) {
        self.title = title
        self.note = note
        self.image = image
    }
    
}
