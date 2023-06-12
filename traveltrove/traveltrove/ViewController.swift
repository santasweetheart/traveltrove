//
//  ViewController.swift
//  traveltrove
//
//  Created by Katherine on 5/30/23.
//

import UIKit

class ViewController: UIViewController {

    let collaboratorsScreen = AddCollaboratorsView()
    
    override func loadView() {
        view = collaboratorsScreen

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for family in UIFont.familyNames {
//            print("Font family: \(family)")
//            for fontName in UIFont.fontNames(forFamilyName: family) {
//                print(" - Font name: \(fontName)")
//            }
//        }

    }


}

