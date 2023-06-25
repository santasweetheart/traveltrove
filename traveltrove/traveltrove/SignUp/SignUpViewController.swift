//
//  SignUpViewController.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/11/23.
//

import UIKit
import PhotosUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage

class SignUpViewController: UIViewController {

    let signUpView = SignUpView()
    var pickedImage:UIImage?
    let database = Firestore.firestore()
    let storage = Storage.storage()
    let childProgressView = ProgressSpinnerViewController()
    
    override func loadView() {
        view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpView.buttonTakePhoto.menu = getMenuImagePicker()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .done, target: self,
                            action: #selector(landingButtonSubmitTapped)
                    )
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func landingButtonSubmitTapped(){
        //MARK: create a Firebase user with email and password...
        if let name = signUpView.nameField.text,
           let email = signUpView.emailField.text,
           let password = signUpView.passField.text,
           let birthdate = signUpView.birthField.text,
           let username = signUpView.emailField.text,
           let password = signUpView.passField.text{
            //Validations....
            Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                if error == nil{
                    //MARK: the user creation is successful...
                    let collectionContacts = self.database
                                    .collection("users")
                                    .document(email.lowercased())
                                    .setData(["name" : name, "email" : email, "birthdate" : birthdate,
                                              "username" : username, "password" : password])
                    let landingPage = LandingPageViewController()
                    self.navigationController?.pushViewController(landingPage, animated: true)
                }else{
                    //MARK: there is a error creating the user...
                    self.showErrorAlert()
                }
            })
        }
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "Error!", message: "Either email is not valid, password needs to be longer than 6 characters, or a textfield is empty.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func getMenuImagePicker() -> UIMenu{
        let menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
            
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    func pickPhotoFromGallery(){
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }
    
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
}

extension SignUpViewController:PHPickerViewControllerDelegate{
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        let itemprovider = results.map(\.itemProvider)
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.signUpView.buttonTakePhoto.setImage(
                                uwImage.withRenderingMode(.alwaysOriginal),
                                for: .normal
                            )
                            self.pickedImage = uwImage
                        }
                    }
                })
            }
        }
    }
}

extension SignUpViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.signUpView.buttonTakePhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }
    }
}
