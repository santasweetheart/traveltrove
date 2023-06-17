//
//  LoginPageView.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/6/23.
//

import UIKit

class LoginPageView: UIView {

    var welcomeLabel: UILabel!
    var messageLabel: UILabel!
    var logoLabel: UILabel!
    var largeImageView:UIImageView!
    var usernameField: UITextField!
    var passwordField: UITextField!
    var loginButton: UIButton!
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        backgroundColor = .customTan
        
        setupImage()
        setupWelcomeLabel()
        setupMessageLabel()
        setupLogoLabel()
        setupUsernameMes()
        setupPasswordMes()
        setupLoginButton()
        initConstraints()
    }
    
    func setupLogoLabel() {
        logoLabel = UILabel()
        logoLabel.text = "TravelTrove"
        logoLabel.font = UIFont.systemFont(ofSize: 15)
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(logoLabel)
    }
    
    func setupImage() {
        largeImageView = UIImageView()
        largeImageView.image = UIImage(named: "suitcaseIntro")
        largeImageView.contentMode = .scaleAspectFill
        largeImageView.clipsToBounds = true
        largeImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(largeImageView)
    }

    func setupWelcomeLabel() {
        welcomeLabel = UILabel()
        welcomeLabel.text = "WELCOME"
        welcomeLabel.font = UIFont.systemFont(ofSize: 32)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(welcomeLabel)
    }
        
    func setupMessageLabel() {
        messageLabel = UILabel()
        messageLabel.text = "Let's get packing!"
        messageLabel.font = UIFont.systemFont(ofSize: 15)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(messageLabel)
    }

    func setupUsernameMes() {
        usernameField = UITextField()
        usernameField.placeholder = "Email"
        usernameField.borderStyle = .roundedRect
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(usernameField)
    }

    func setupPasswordMes() {
        passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(passwordField)
    }
    
    func setupLoginButton() {
        loginButton = UIButton(type: .system)
        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = 20
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.backgroundColor = .white
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(loginButton)
    }

    func initConstraints(){
        NSLayoutConstraint.activate([
            logoLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            logoLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
                                                   
            welcomeLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            welcomeLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            welcomeLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            messageLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            messageLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 12),
            messageLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            usernameField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            usernameField.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 30),
            usernameField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            usernameField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            passwordField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 30),
            passwordField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            passwordField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            loginButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 32),
            loginButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 64),
            loginButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            largeImageView.heightAnchor.constraint(equalToConstant: 400),
            largeImageView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            largeImageView.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 40),
            largeImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 165),

        ])
    }

    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
