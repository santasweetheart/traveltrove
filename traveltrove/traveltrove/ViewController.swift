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
        // Do any additional setup after loading the view.
        view.backgroundColor = .customTan
        createLabel()
        initConstraints()
        print("Font being used: \(hello.font!.fontName)")
        
        for family in UIFont.familyNames {
            print("Font family: \(family)")
            for fontName in UIFont.fontNames(forFamilyName: family) {
                print(" - Font name: \(fontName)")
            }
        }

    }
    
    
    func createLabel() {
        hello = UILabel()
        hello.text = "Hello World"
        hello.font = UIFont(name:"Imprima-Regular", size: 16)
        hello.textAlignment = .center
        hello.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hello)
    }
    
    func initConstraints() {
        // Activate the constraints
        NSLayoutConstraint.activate([
            hello.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            hello.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        ])
    }


}

