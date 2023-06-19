//
//  ViewController.swift
//  traveltrove
//
//  Created by Santa on 5/30/23.
//
import UIKit
import PhotosUI

class ViewController: UIViewController {

    let screen = IndividualDocView()
    

    override func loadView() {
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(
                        barButtonSystemItem: .add, target: self,
                        action: #selector(onAddBarButtonTapped)
                )
        }
        
            @objc func onAddBarButtonTapped(){
                var login = SignUpViewController()
                //var login = LoginPageViewController()
                navigationController?.pushViewController(login, animated: true)
            }
    
       
}


