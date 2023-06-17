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
    var contentWrapper:UIScrollView!
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        backgroundColor = .customPeach
        setupContentWrapper()
        setupDocLabel()
        setupNameField()
        setupNotesField()
        setupPhotoLabel()
        setupbuttonTakePhoto()
    
        
        initConstraints()
        
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupDocLabel() {
        docLabel = UILabel()
        docLabel.text = "Add a New Document"
        docLabel.font = UIFont.systemFont(ofSize: 20)
        docLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(docLabel)
    }
    
    func setupNameField() {
        nameField = UITextField()
        nameField.placeholder = "Name"
        nameField.borderStyle = .roundedRect
        nameField.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(nameField)
    }
    
    
    func setupNotesField() {
        notesField = UITextField()
        notesField.placeholder = "Notes"
        notesField.borderStyle = .roundedRect
        notesField.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(notesField)
    }
    
    func setupPhotoLabel() {
        photoLabel = UILabel()
        photoLabel.text = "Add a Photo:"
       // photoLabel.font = UIFont.systemFont(ofSize: 15)
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(photoLabel)
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
        contentWrapper.addSubview(buttonTakePhoto)
    }



//MARK: initialize the constraints...
func initConstraints(){
    NSLayoutConstraint.activate([
        contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
        contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
        contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
        contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
        
        docLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        docLabel.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 150),
        
//        docLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
//        docLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 150),
       
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
        buttonTakePhoto.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor)
    ])
}



    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

