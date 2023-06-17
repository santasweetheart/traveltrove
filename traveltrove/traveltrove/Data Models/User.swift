//
//  User.swift
//  traveltrove
//
//  Created by Santa.
//

import Foundation
import UIKit

struct User {
    var name: String?
    var email: String?
    var image: UIImage?
    
    init(name: String? = nil, email: String? = nil, image:UIImage? = nil) {
        self.name = name
        self.email = email
        self.image = image
    }
}
