//
//  LoadDocumentsManager.swift
//  traveltrove
//
//  Created by Katherine on 6/23/23.
//

import Foundation
import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
import FirebaseStorage

extension ImportantDocsViewController {
    func loadDocumentsIntoView(){
        print("here")
        self.database.collection("users").document((self.currentUser?.email)!).collection("documents").addSnapshotListener(includeMetadataChanges: false, listener: { querySnapshot, error in
            if let error = error {
                print("Could not add listener: \(error)")
            } else {
                //Handle snapshot changes and perfomr any necessary operations
                var listOfDocs: [DocumentReference] = []
                if let newDocs = querySnapshot?.documents{
                    self.documents.removeAll()
                    print("\((self.currentUser?.email)!)")
                    print("Number of new documents: \(newDocs.count)")
                    print("querySnapshot: \(querySnapshot)")
                    for doc in newDocs{
                        do {
                            //create a Document data type
                            //self.database.collection("documents/\(currentUser.email)/\(docName)")
                            print("\(doc.documentID) : \(doc.data())")
                            //let collectionRef = self.database.collection("documents/\((self.currentUser?.email!)!)/\(doc)")
                            //listOfDocs.append(collectionRef)
                            
                            print(listOfDocs)
                        } catch {
                            print(error)
                        }
                    }
                    
                } else {
                    print("No new documents found")
                }

            }
        })
    }
    
    
//    func loadDocumentsIntoView() {
//        print("Function Called")
//        self.showActivityIndicator()
//        let collectionDocuments = self.database.collection("users")
//            .whereField("email", isEqualTo: currentUser?.email!)
//            .addSnapshotListener { (querySnapshot, error) in
//                if let error = error {
//                    print(error)
//                } else {
//                    // Get the current user's document
//                    if let document = querySnapshot?.documents.first {
//                        // Add a listener to the current user's document collection
//                        self.database.collection("users").document(document.documentID).collection("documents").addSnapshotListener { (querySnapshot, error) in
//                            if let error = error {
//                                print(error)
//                            } else {
//                                // Handle the snapshot changes & Perform any necessary operations & update UI
//                                let newDocs = querySnapshot?.documents // Access the updated documents
//
//                                // Convert each item in the snapshot to Document data type
//                                var convertedDocs: [Document] = []
//                                for doc in newDocs! {
//                                    // Get first image from the images collection
//                                    let imagesCollection = self.database.collection("users").document(document.documentID).collection("images")
//                                    var listofimages: [UIImage] = []
//                                    imagesCollection.getDocuments(completion: { (querySnapshot, error) in
//                                        if let error = error {
//                                            print("Error getting documents: \(error)")
//                                        } else {
//                                            for image in querySnapshot!.documents {
//                                                let i = UIImageView()
//                                                if let urlString = image["url"] as? String, let url = URL(string: urlString) {
//                                                    i.loadRemoteImage(from: url) { loadedImage in
//                                                        if let image = loadedImage {
//                                                            listofimages.append(image)
//                                                        } else {
//                                                            // Handle the case when the image couldn't be loaded
//                                                            print("Failed to load the image from URL: \(url)")
//                                                        }
//                                                    }
//                                                } else {
//                                                    // Handle the case when the URL string is not valid
//                                                    print("Invalid URL string")
//                                                }
//
//                                            }
//                                        }
//                                    })
//
//                                    // Access the reference of each document
//                                    let docRefData = doc.data()["doc"]
//
//                                    // Ensure `docRefData` is a valid `DocumentReference`
//                                    if let docRef = docRefData as? DocumentReference {
//                                        // Use `docRef` to get the referenced document
//                                        docRef.getDocument { (document, error) in
//                                            if let error = error {
//                                                print(error)
//                                            } else {
//                                                if let document = document, document.exists {
//                                                    // Document exists, access the data using document.data()
//                                                    if let documentData = document.data() {
//                                                        // Access the specific fields from documentData as needed
//                                                        if let title = documentData["title"] as? String,
//                                                           let note = documentData["note"] as? String {
//                                                            // Create Document datatype
//                                                            let document = Document(title: title, note: note, images: listofimages)
//                                                            convertedDocs.append(document)
//                                                        }
//                                                    }
//                                                } else {
//                                                    // Document doesn't exist
//                                                    print("Referenced document does not exist")
//                                                }
//                                            }
//                                        }
//                                    } else {
//                                        // Handle the case when `docRefData` is not a valid `DocumentReference`
//                                        print("Invalid document reference data")
//                                    }
//                                }
//
//                                // Set documents equal to convertedDocs from snapshot
//                                self.documents = convertedDocs
//                                print("documents: \(self.documents)")
//                                // Reload the table
//                                self.importantDocsView.tableViewDocs.reloadData()
//                                self.hideActivityIndicator()
//                            }
//                        }
//                    } else {
//                        print("Error: Docs not found in database")
//                    }
//                }
//            }
//    }
    
}
