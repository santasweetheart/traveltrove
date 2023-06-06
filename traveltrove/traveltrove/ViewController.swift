//
//  ViewController.swift
//  traveltrove
//
//  Created by Santa on 5/30/23.
//

import UIKit

class ViewController: UIViewController {

    let introscreen = LandingPageView()
    
    override func loadView() {
        view = introscreen
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

