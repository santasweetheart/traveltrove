//
//  LoadDocumentsManager.swift
//  traveltrove
//
//  Created by Santa on 6/23/23.
//

import Foundation
import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
import FirebaseStorage

extension ImportantDocsViewController {
    
    func loadDocumentsIntoView(){
        var listOfDocs: [Document] = []
        var processedCount = 0
        var totalDocs = 0
        
        self.database.collection("users").document((self.currentUser?.email)!).collection("documents").addSnapshotListener(includeMetadataChanges: false, listener: { querySnapshot, error in
            if let error = error {
                print("Could not add listener: \(error)")
            } else {
                //Handle snapshot changes and perfomrany necessary operations
                if let newDocs = querySnapshot?.documents{
                    totalDocs = newDocs.count
                    
                    self.documents.removeAll()
                    for doc in newDocs{
                        //Get Document's Reference
                        let thisDocRef = doc.data()["doc"] as! DocumentReference
                        
                        //Turn the document into Document.self data type
                        self.convertRefToLocalDocument(thisDocRef: thisDocRef, completion: {thisLocalDoc in
                            if let uwThisLocalDoc = thisLocalDoc {
                                //Append Document to list
                                listOfDocs.append(uwThisLocalDoc)
                                
                                //Keep track of the number of processed documents
                                processedCount += 1
                                
                                //If the number of processed documents is equal to the total num of docs then
                                //update self.documents
                                if processedCount == totalDocs {
                                    self.documents = listOfDocs
                                    self.importantDocsView.tableViewDocs.reloadData() // Reload the table view after updating the data
                                }

                            } else {
                                // Handle the case when the document couldn't be retrieved
                                print("Failed to retrieve the document")
                            }
                        })
                    }
                    
                } else {
                    print("No new documents found")
                }

            }
        })
    }
    

    func convertRefToLocalDocument(thisDocRef: DocumentReference, completion: @escaping (Document?) -> Void) {
        let documentsCollection = self.database.collection("documents")
        
        // Go to documentsCollection and get this document
        documentsCollection.document(thisDocRef.documentID).getDocument { (docSnapshot, error) in
            if let error = error {
                print(error)
                completion(nil) // Invoke completion with nil if there was an error
            } else {
                if let thisDoc = docSnapshot {
                    //Create a Dcoument
                    let thisDocData = thisDoc.data()
                    let thisDocName = thisDocData!["name"] as! String
                    let thisDocNote = thisDocData!["note"] as! String
                    self.getImageOfRef(thisDocRef: thisDocRef) { listOfUrlStrings in
                        let thisLocalDoc = Document(title: thisDocName, note: thisDocNote, images: listOfUrlStrings)
                        completion(thisLocalDoc) // Invoke completion with the document
                    }
                    
                } else {
                    completion(nil)// Invoke completion with nil if the document doesn't exist
                }
            }
        }
    }

    func getImageOfRef(thisDocRef: DocumentReference, completion: @escaping ([String]) -> Void) {
        var listOfUrlStrings: [String] = []
        let userImagesCollection = self.database.collection("documents").document(thisDocRef.documentID).collection("images")
        
        userImagesCollection.getDocuments { (querySnapshot, error) in
            if let error = error {
                print(error)
                completion([]) // Invoke completion with an empty array if there was an error
            } else {
                if let imageDocs = querySnapshot?.documents {
                    for imageDoc in imageDocs {
                        let imageUrlString = imageDoc.data()["url"] as? String
                        if let urlString = imageUrlString {
                            listOfUrlStrings.append(urlString)
                        }
                    }
                }
                completion(listOfUrlStrings) // Invoke completion with the fetched URLs
            }
        }
    }

}
