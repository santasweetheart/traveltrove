//
//  CustomButton.swift
//  traveltrove
//
//  Created by Santa on 6/6/23.
//

import Foundation
import UIKit

///This class extends the UIButton class to create a custom pill shaped button
extension UIButton {
    static func createPillShapedButton(withTitle title: String, buttonColor color: UIColor, size: CGSize = CGSize(width: 125, height: 50)) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = size.height / 2
        button.clipsToBounds = true
        button.backgroundColor = color
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        
        // Set button size
         button.widthAnchor.constraint(equalToConstant: size.width).isActive = true
         button.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return button
        }
}
