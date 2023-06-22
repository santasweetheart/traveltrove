//
//  ViewController.swift
//  traveltrove
//
//  Created by Santa on 5/30/23.
//
import UIKit
import PhotosUI

class ViewController: UIViewController {

    let introScreen = IntroPageView()
    

    override func loadView() {
        view = introScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.introScreen.loginButton.addTarget(self, action: #selector(loginButtonSubmitTapped), for: .touchUpInside)
        
        self.introScreen.signupButton.addTarget(self, action: #selector(registerButtonSubmitTapped), for: .touchUpInside)
    }
        
    @objc func loginButtonSubmitTapped(){
        var login = LoginPageViewController()
        navigationController?.pushViewController(login, animated: true)
    }
    
    @objc func registerButtonSubmitTapped(){
        var signUp = SignUpViewController()
        navigationController?.pushViewController(signUp, animated: true)
    }
}


