//
//  LoginPageViewController.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/6/23.
//

import UIKit

class LoginPageViewController: UIViewController {

    let loginPageView = LoginPageView()

    override func loadView() {
        view = loginPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem?.tintColor = .black
        configureItems()
    }

    private func configureItems() {
        let customItem = UIBarButtonItem(customView: loginPageView.logoLabel)
        navigationItem.rightBarButtonItem = customItem
        self.navigationItem.rightBarButtonItem?.customView?.isUserInteractionEnabled = false
    }

}
