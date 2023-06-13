//
//  ViewController.swift
//  traveltrove
//
//  Created by Santa on 5/30/23.
//
import UIKit

class ViewController: UIViewController {
    
    let introscreen = IntroPageView()
    
    override func loadView() {
        view = introscreen
    }
}
