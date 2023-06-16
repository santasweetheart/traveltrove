//
//  LoginPageViewController.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/6/23.
//

import UIKit

class LoginPageViewController: UIViewController {

    let loginPageView = LoginPageView()
    //MARK: add the view to this controller while the view is loading...
    override func loadView() {
        view = loginPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem?.tintColor = .black
        configureItems()
        // Do any additional setup after loading the view.
        
        
        
    }

    private func configureItems() {
        let customItem = UIBarButtonItem(customView: loginPageView.logoLabel)
        navigationItem.rightBarButtonItem = customItem
        self.navigationItem.rightBarButtonItem?.customView?.isUserInteractionEnabled = false
    
       // let customLeft =  UIBarButtonItem(customView: .)
        
        
            
    }

}
