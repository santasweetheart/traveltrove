//
//  Utilites.swift
//  traveltrove
//
//  Created by Santa on 6/6/23.
//

import Foundation
import UIKit


/// Creates a UILabel with the specified attributes.
///
/// - Parameters:
///   - text: The text to be displayed in the label.
    ///   - font: The font to be applied to the label's text.
    ///   - textColor: The color of the label's text.
    /// - Returns: A configured UILabel object.
///
    struct Static {
        static var lists = [List]()
        static var lastNum = 0
        
    }

    func createLabel(labelText: String, size: CGFloat, color: UIColor ) -> UILabel! {
        let label : UILabel! = UILabel()
        label.text = labelText
        label.font = UIFont.systemFont(ofSize: size)
        label.textColor = color
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    

