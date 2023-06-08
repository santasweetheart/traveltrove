//
//  IntroPageView.swift
//  traveltrove
//
//  Created by Santa on 6/5/23.
//

import UIKit

class IntroPageView: UIView {

    var logoImageView: UIImageView!
    var appNameLabel: UILabel!
    var appDescriptionLabel: UILabel!
    var loginButton: UIButton!
    var signupButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .customTan
        
        setupLogoImageView()
        setupNameLabel()
        setupAppDescriptionLabel()
        setupButtons()
        initConstraints()
        
    }
    
    func setupLogoImageView() {
        logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "logo")
        logoImageView.contentMode = .scaleToFill
        logoImageView.clipsToBounds = true
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(logoImageView)
        
    }
    
    func setupNameLabel(){
        appNameLabel = createLabel(labelText: "TravelTrove", size: 40, color: .black)
        self.addSubview(appNameLabel)
    }
    
    func setupAppDescriptionLabel(){
        appDescriptionLabel = createLabel(
            labelText: """
                TravelTrove is a digital platform that serves as a
                valuable resource for travelers, offering tools to
                make packing easier.
""", size: 14, color: .black)
        appDescriptionLabel.numberOfLines = 0 // Enable multiline text
        appDescriptionLabel.lineBreakMode = .byWordWrapping // Specify the line break mode
        self.addSubview(appDescriptionLabel)
    }
    
    
    func setupButtons(){
        loginButton = UIButton.createPillShapedButton(withTitle: "Login", buttonColor: .customPeach)
        self.addSubview(loginButton)
        signupButton = UIButton.createPillShapedButton(withTitle: "Sign Up", buttonColor: .customPeach)
        self.addSubview(signupButton)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            appNameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 32),
            appNameLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

            appDescriptionLabel.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: 16),
            appDescriptionLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: -16),

            loginButton.topAnchor.constraint(equalTo: appDescriptionLabel.bottomAnchor, constant: 48),
            loginButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 48),

            signupButton.topAnchor.constraint(equalTo: appDescriptionLabel.bottomAnchor, constant: 48),
            signupButton.leadingAnchor.constraint(equalTo: loginButton.trailingAnchor, constant: 48),
            signupButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -48)
        ])
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
