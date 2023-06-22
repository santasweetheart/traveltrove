//
//  NewDocImageManager.swift
//  traveltrove
//
//  Created by Katherine on 6/21/23.
//

import Foundation
import FirebaseAuth

extension NewDocViewController {
    
    func uploadImageToStorage() {
        var photoURL:URL?
        
        //MARK: Upload the profile photo if there is any...
        if let image = pickedImage{
            if let jpegData = image.jpegData(compressionQuality: 80){
                let storageRef = storage.reference()
                let imagesRepo = storageRef.child("documentImages")
                let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
                
                let uploadTask = imageRef.putData(jpegData, completion: {(metadata, error) in
                    if error == nil{
                        imageRef.downloadURL(completion: {(url, error) in
                            if error == nil{
                                photoURL = url
                                self.createDocumentInFirebase(photoUrl: photoURL)
                            }
                        })
                    }
                })
            }
        }
    }
    
    func createDocumentInFirebase(photoUrl: URL?) {
        if let docName = newDocView.nameField.text,
            let note = newDocView.notesField.text,
            let currentUser = Auth.auth().currentUser {
            
            // MARK: Add document to documents collection
            let collectionDocuments = self.database.collection("documents").document(docName).setData(["dateCreated": Date(), "name": docName, "note": note]) { error in
                if let error = error {
                    print(error)
                } else {
                    // MARK: Add image URL to document's images
                    if let photoURL = photoUrl {
                        let collectionImages = self.database.collection("documents").document(docName).collection("images").addDocument(data: ["url": photoURL.absoluteString])
                    }
                    
                    // MARK: Connect document to user
                    self.connectDocToUserInFirebase(currentUser : currentUser, doc : docName)
                }
            }
        }
    }
    
    func connectDocToUserInFirebase(currentUser : FirebaseAuth.User, doc : String ){
        let collectionDocuments = self.database.collection("users")
            .whereField("email", isEqualTo: currentUser.email!)
            .getDocuments() { (querySnapshot, error) in
                if let error = error {
                    print(error)
                } else {
                    if let document = querySnapshot?.documents.first {
                        // Document with the title matching the given doc name found
                        // access the document using `document.data()`
                        
                        //get reference from documents collection
                        let documentsRef = self.database.collection("documents").document(doc)
                        
                        // MARK: Connect document to user
                        let usersDocsCollection = self.database.collection("users").document(document.documentID).collection("documents").addDocument(data: ["doc": documentsRef])
                    } else {
                        // Document not found
                        print("Error: Doc not found in database")
                    }
                }
            }
        
    }

    
    
}
