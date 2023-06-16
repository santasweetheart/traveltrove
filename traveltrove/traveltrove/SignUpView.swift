//
//  SignUpView.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/11/23.
//

import UIKit

class SignUpView: UIView {

    var joinLabel: UILabel!
    var descriptionLabel: UILabel!
    var nameLabel: UILabel!
    var nameField: UITextField!
    
    var emailLabel: UILabel!
    var emailField: UITextField!
    
    var usernameLabel: UILabel!
    var usernameField: UITextField!
    
    var birthLabel: UILabel!
    var birthField: UITextField!
    
    var passLabel: UILabel!
    var passField: UITextField!
    
    var photoLabel: UILabel!
    var buttonTakePhoto: UIButton!
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        backgroundColor = .customPeach
        
        setupjoinLabel()
        setupdescriptionLabel()
        setupnameLabel()
        setupnameField()
        
        setupemailLabel()
        setupemailField()
        
        setupbirthLabel()
        setupbirthField()
        
        setupUsernameLabel()
        setupUsernameField()
        
        setuppassLabel()
        setuppassField()
        
        setupPhotoLabel()
        setupbuttonTakePhoto()
        
        
        initConstraints()
        
    }
    
    func setupjoinLabel() {
        joinLabel = UILabel()
        joinLabel.text = "Join TravelTrove"
        joinLabel.font = UIFont.systemFont(ofSize: 28)
        joinLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(joinLabel)
    }
    
    func setupdescriptionLabel() {
        descriptionLabel = UILabel()
        descriptionLabel.text = "The best app for travelers"
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(descriptionLabel)
    }
    
    func setupnameLabel() {
        nameLabel = UILabel()
        nameLabel.text = "Name"
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
    }

    func setupnameField() {
        nameField = UITextField()
        //nameField.placeholder = "Name"
        nameField.borderStyle = .roundedRect
        nameField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameField)
    }
    
    func setupemailLabel() {
        emailLabel = UILabel()
        emailLabel.text = "Email"
        emailLabel.font = UIFont.systemFont(ofSize: 15)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailLabel)
    }
    
    func setupemailField() {
        emailField = UITextField()
        emailField.borderStyle = .roundedRect
        emailField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailField)
    }
    
    func setupbirthLabel() {
        birthLabel = UILabel()
        birthLabel.text = "Birthdate"
        birthLabel.font = UIFont.systemFont(ofSize: 15)
        birthLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(birthLabel)
    }
    
    func setupbirthField() {
        birthField = UITextField()
        birthField.borderStyle = .roundedRect
        birthField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(birthField)
    }
    
    func setupUsernameLabel() {
        usernameLabel = UILabel()
        usernameLabel.text = "Username"
        usernameLabel.font = UIFont.systemFont(ofSize: 15)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(usernameLabel)
    }
    
    func setupUsernameField() {
        usernameField = UITextField()
        usernameField.borderStyle = .roundedRect
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(usernameField)
    }
    
    func setuppassLabel() {
        passLabel = UILabel()
        passLabel.text = "Password"
        passLabel.font = UIFont.systemFont(ofSize: 15)
        passLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(passLabel)
    }
    
    func setuppassField() {
        passField = UITextField()
        passField.borderStyle = .roundedRect
        passField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(passField)
    }
    
    func setupPhotoLabel() {
        photoLabel = UILabel()
        photoLabel.text = "Choose a Photo (Optional)"
        photoLabel.font = UIFont.systemFont(ofSize: 15)
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(photoLabel)
    }
    
    func setupbuttonTakePhoto(){
            buttonTakePhoto = UIButton(type: .system)
            buttonTakePhoto.setTitle("", for: .normal)
            buttonTakePhoto.showsMenuAsPrimaryAction = true
            buttonTakePhoto.setImage(UIImage(systemName: "camera.fill"), for: .normal)
            buttonTakePhoto.tintColor = .black
            buttonTakePhoto.contentHorizontalAlignment = .fill
            buttonTakePhoto.contentVerticalAlignment = .fill
            buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
            buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(buttonTakePhoto)
    }



//MARK: initialize the constraints...
func initConstraints(){
    NSLayoutConstraint.activate([
        joinLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        joinLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
        
        descriptionLabel.topAnchor.constraint(equalTo: self.joinLabel.bottomAnchor, constant: 16),
        //escriptionLabel.leadingAnchor.constraint(equalTo:
          //                                          self.safeAreaLayoutGuide.leadingAnchor, constant:
        //16),
        descriptionLabel.centerXAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.centerXAnchor),
        
       // nameLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        nameLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 20),
        nameLabel.leadingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.leadingAnchor, constant:
        16),

        // buttonSend constraints...
       
        nameField.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 12),
        nameField.leadingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.leadingAnchor, constant:
        16),
        nameField.trailingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.trailingAnchor,
        constant: -16),
        
        emailLabel.topAnchor.constraint(equalTo: self.nameField.bottomAnchor, constant: 20),
        emailLabel.leadingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.leadingAnchor, constant:
        16),

        // buttonSend constraints...
       
        emailField.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 12),
        emailField.leadingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.leadingAnchor, constant:
        16),
        emailField.trailingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.trailingAnchor,
        constant: -16),
        
        birthLabel.topAnchor.constraint(equalTo: self.emailField.bottomAnchor, constant: 20),
        birthLabel.leadingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.leadingAnchor, constant:
        16),

        // buttonSend constraints...
       
        birthField.topAnchor.constraint(equalTo: self.birthLabel.bottomAnchor, constant: 12),
        birthField.leadingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.leadingAnchor, constant:
        16),
        birthField.trailingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.trailingAnchor,
        constant: -16),
        
        usernameLabel.topAnchor.constraint(equalTo: self.birthField.bottomAnchor, constant: 20),
        usernameLabel.leadingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.leadingAnchor, constant:
        16),

        // buttonSend constraints...
       
        usernameField.topAnchor.constraint(equalTo: self.usernameLabel.bottomAnchor, constant: 12),
        usernameField.leadingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.leadingAnchor, constant:
        16),
        usernameField.trailingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.trailingAnchor,
        constant: -16),
        
        passLabel.topAnchor.constraint(equalTo: self.usernameField.bottomAnchor, constant: 20),
        passLabel.leadingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.leadingAnchor, constant:
        16),

        // buttonSend constraints...
       
        passField.topAnchor.constraint(equalTo: self.passLabel.bottomAnchor, constant: 12),
        passField.leadingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.leadingAnchor, constant:
        16),
        passField.trailingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.trailingAnchor,
        constant: -16),
        
        photoLabel.topAnchor.constraint(equalTo: self.passField.bottomAnchor, constant: 20),
        photoLabel.leadingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.leadingAnchor, constant:
        16),
        
        buttonTakePhoto.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 16),
        buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
        buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),

        // buttonSend constraints...
       
//        passField.topAnchor.constraint(equalTo: self.passLabel.bottomAnchor, constant: 12),
//        passField.leadingAnchor.constraint(equalTo:
//                                                    self.safeAreaLayoutGuide.leadingAnchor, constant:
//        16),
//        passField.trailingAnchor.constraint(equalTo:
//                                                    self.safeAreaLayoutGuide.trailingAnchor,
//        constant: -16),

    ])
}



    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

