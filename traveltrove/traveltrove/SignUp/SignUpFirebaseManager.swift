//
//  SignUpFirebaseManager.swift
//  traveltrove
//
//  Created by Santa on 6/19/23.
//

import Foundation
import FirebaseAuth
import FirebaseStorage


extension SignUpViewController {
    
    func uploadProfilePhotoToStorage(){
          var profilePhotoURL:URL?
          
          //MARK: Upload the profile photo if there is any...
          if let image = pickedImage{
              if let jpegData = image.jpegData(compressionQuality: 80){
                  let storageRef = storage.reference()
                  let imagesRepo = storageRef.child("imagesUsers")
                  let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
                  
                  let uploadTask = imageRef.putData(jpegData, completion: {(metadata, error) in
                      if error == nil{
                          imageRef.downloadURL(completion: {(url, error) in
                              if error == nil{
                                  profilePhotoURL = url
                                  self.registerUser(photoURL: profilePhotoURL)
                              }
                          })
                      }
                  })
              }
          }else{
              registerUser(photoURL: profilePhotoURL)
          }
      }
      
      func registerUser(photoURL: URL?){
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
                                      .document(email)
                                      .setData(["name" : name, "email" : email, "birthdate" : birthdate,
                                                "username" : username, "password" : password])
                      self.setNameAndPhotoOfTheUserInFirebaseAuth(name: name, email: email, photoURL: photoURL)
                  }else{
                      //MARK: there is a error creating the user...
                      print(error)
                  }
              })
          }
      }
      
      func setNameAndPhotoOfTheUserInFirebaseAuth(name: String, email: String, photoURL: URL?){
          let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
          changeRequest?.displayName = name
          changeRequest?.photoURL = photoURL
          
          print("\(photoURL)")
          changeRequest?.commitChanges(completion: {(error) in
              if error != nil{
                  print("Error occured: \(String(describing: error))")
              }else{
                  self.hideActivityIndicator()
                  let landingPage = LandingPageViewController()
                  self.navigationController?.pushViewController(landingPage, animated: true)
              }
          })
      }
       
}
