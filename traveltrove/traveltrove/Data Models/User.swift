//
//  User.swift
//  traveltrove
//
//  Created by Santa.
//

import Foundation
import UIKit
 
struct User : Codable {
    var name: String
    var email: String
    var birthdate : String
    var username : String
    var password : String
    
    init(name: String, email: String, birthdate: String, username: String, password: String) {
        self.name = name
        self.email = email
        self.birthdate = birthdate
        self.username = username
        self.password = password
    }
}
