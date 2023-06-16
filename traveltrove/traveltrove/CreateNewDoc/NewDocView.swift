//
//  NewDocView.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/12/23.
//

import UIKit

class NewDocView: UIView {

    var docLabel: UILabel!
    var nameField: UITextField!
    var notesField: UITextField!
    
    var photoLabel: UILabel!
    var buttonTakePhoto: UIButton!
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        backgroundColor = .customPeach
        
        setupDocLabel()
        setupNameField()
        setupNotesField()
        setupPhotoLabel()
        setupbuttonTakePhoto()
    
        
        initConstraints()
        
    }
    
    func setupDocLabel() {
        docLabel = UILabel()
        docLabel.text = "Add a New Document"
        docLabel.font = UIFont.systemFont(ofSize: 20)
        docLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(docLabel)
    }
    
    func setupNameField() {
        nameField = UITextField()
        nameField.placeholder = "Name"
        nameField.borderStyle = .roundedRect
        nameField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameField)
    }
    
    
    func setupNotesField() {
        notesField = UITextField()
        notesField.placeholder = "Notes"
        notesField.borderStyle = .roundedRect
        notesField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(notesField)
    }
    
    func setupPhotoLabel() {
        photoLabel = UILabel()
        photoLabel.text = "Add a Photo:"
       // photoLabel.font = UIFont.systemFont(ofSize: 15)
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
        docLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        //docLabel.bottomAnchor.constraint(equalTo: self.nameField.topAnchor, constant: -50),
        docLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 150),
       
        nameField.topAnchor.constraint(equalTo: self.docLabel.bottomAnchor, constant: 50),
        nameField.leadingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.leadingAnchor, constant:
        16),
        nameField.trailingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.trailingAnchor,
        constant: -16),
    

        // buttonSend constraints...
       
        //notesField.topAnchor.constraint(equalTo: self.nameField.bottomAnchor, constant: 20),
        notesField.topAnchor.constraint(equalTo: self.nameField.bottomAnchor, constant: 30),
        notesField.leadingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.leadingAnchor, constant:
        16),
        notesField.trailingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.trailingAnchor,
        constant: -16),
        
        
        photoLabel.topAnchor.constraint(equalTo: self.notesField.bottomAnchor, constant: 50),
        photoLabel.leadingAnchor.constraint(equalTo:
                                                    self.safeAreaLayoutGuide.leadingAnchor, constant:
        16),
        
        buttonTakePhoto.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 30),
        buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
        buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),
    ])
}



    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

