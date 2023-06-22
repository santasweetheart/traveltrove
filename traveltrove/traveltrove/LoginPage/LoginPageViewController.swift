//
//  LoginPageViewController.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/6/23.
//

import UIKit
import FirebaseAuth

class LoginPageViewController: UIViewController {

    let loginPageView = LoginPageView()

    override func loadView() {
        view = loginPageView
        
        self.loginPageView.loginButton.addTarget(self, action: #selector(landingButtonSubmitTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem?.tintColor = .black
        configureItems()
    }
    
    @objc func landingButtonSubmitTapped() {
        if let email = loginPageView.emailField.text,
           let password = loginPageView.passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: {(result, error) in
                if error == nil{
                    //MARK: user authenticated...
                    //MARK: can you hide the progress indicator here?
                    let landingPage = LandingPageViewController()
                    self.navigationController?.pushViewController(landingPage, animated: true)
                }else{
                    //MARK: alert that no user found or password wrong...
                }
            })
        }
    }

    private func configureItems() {
        let customItem = UIBarButtonItem(customView: loginPageView.logoLabel)
        navigationItem.rightBarButtonItem = customItem
        self.navigationItem.rightBarButtonItem?.customView?.isUserInteractionEnabled = false
    }

}
