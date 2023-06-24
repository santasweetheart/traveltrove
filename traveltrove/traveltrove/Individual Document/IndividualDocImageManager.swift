//
//  IndividualDocImageManager.swift
//  traveltrove
//
//  Created by Santa on 6/24/23.
//

import Foundation
import FirebaseAuth

extension IndividualDocViewController {
    
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
                                self.addImageInFirebase(photoUrl: photoURL)
                            }
                        })
                    }
                })
            }
        }
    }
    
    func addImageInFirebase(photoUrl: URL?) {
        // MARK: Add image to selectedDocument's images collection
        if let photoURL = photoUrl {
            let collectionImages = self.database.collection("documents")
                .document(selectedDoc.title)
                .collection("images")
                .addDocument(data: ["url": photoURL.absoluteString])
            }
        reloadSelectedDocument()
        
        }
    
    func reloadSelectedDocument(){
        //Go to database and find current document
        var listOfUrlStrings : [String] = []
        var processedUrls = 0
        var totalUrls = 0
        
        let collectionImages = self.database.collection("documents")
            .document(selectedDoc.title)
            .collection("images").getDocuments(completion: {querySnapshot ,error in
                if let error = error {
                    print(error)
                } else {
                    if let imageDocs = querySnapshot?.documents {
                        totalUrls = imageDocs.count
                        for imageDoc in imageDocs {
                            let imageUrlString = imageDoc.data()["url"] as? String
                            if let urlString = imageUrlString {
                                listOfUrlStrings.append(urlString)

                                processedUrls += 1

                                if processedUrls == totalUrls {
                                    self.selectedDoc.images = listOfUrlStrings
                                    self.screen.tableViewImage.reloadData()
                                }
                            }
                        }
                    }
                }
            })
    }

    
}
                                               
