//
//  ViewController.swift
//  traveltrove
//
//  Created by Katherine on 5/30/23.
//

import UIKit

class ViewController: UIViewController {

    var hello: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for family in UIFont.familyNames {
//            print("Font family: \(family)")
//            for fontName in UIFont.fontNames(forFamilyName: family) {
//                print(" - Font name: \(fontName)")
//            }
//        }

        navigationItem.rightBarButtonItem = UIBarButtonItem(
                            barButtonSystemItem: .add, target: self,
                            action: #selector(onAddBarButtonTapped)
                    )
                }
            
                @objc func onAddBarButtonTapped(){
                    var login = ListsViewController()
                    //var login = LoginPageViewController()
                    navigationController?.pushViewController(login, animated: true)
                }

}

