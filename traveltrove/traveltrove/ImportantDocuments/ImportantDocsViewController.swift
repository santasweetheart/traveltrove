//
//  ImportantDocsViewController.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/11/23.
//

import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
import FirebaseStorage

class ImportantDocsViewController: UIViewController {
    let importantDocsView = ImportantDocumentsView()
    let database = Firestore.firestore()
    let storage = Storage.storage()
    let currentUser = Auth.auth().currentUser
    var documents = [Document]()
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = importantDocsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        importantDocsView.tableViewDocs.separatorStyle = .none
        title = "Important Documents"
    
        importantDocsView.tableViewDocs.delegate = self
        importantDocsView.tableViewDocs.dataSource = self
        importantDocsView.addButton.addTarget(self, action: #selector(onButtonSubmitTapped), for: .touchUpInside)
        
        notificationCenter.addObserver(
            self,
            selector: #selector(notificationReceivedForTextChanged(notification:)),
            name: Notification.Name("textFromFirstScreen"),
            object: nil)
    }
    
    @objc func notificationReceivedForTextChanged(notification: Notification) {
        // documents.append(Document(title: (notification.object as! Document).title!,
        //                          note: (notification.object as! Document).note!,
        //                          image: (notification.object as! Document).image))
        
        let collectionDocuments = self.database.collection("users")
            .whereField("email", isEqualTo: currentUser?.email!)
            .addSnapshotListener { (querySnapshot, error) in
                if let error = error {
                    print(error)
                } else {
                    // Get the current user's document
                    if let document = querySnapshot?.documents.first {
                        // Add a listener to the current user's document collection
                        self.database.collection("users").document(document.documentID).collection("documents").addSnapshotListener { (querySnapshot, error) in
                            if let error = error {
                                print(error)
                            } else {
                                // Handle the snapshot changes & Perform any necessary operations & update UI
                                let newDocs = querySnapshot?.documents // Access the updated documents
                                
                                // Convert each item in the snapshot to Document data type
                                var convertedDocs: [Document] = []
                                for doc in newDocs! {
                                    // Get first image from the images collection
                                    let imagesCollection = self.database.collection("users").document(document.documentID).collection("images")
                                    var listofimages: [UIImage] = []
                                    imagesCollection.getDocuments(completion: { (querySnapshot, error) in
                                        if let error = error {
                                            print("Error getting documents: \(error)")
                                        } else {
                                            for image in querySnapshot!.documents {
                                                let i = UIImageView()
                                                if let urlString = image["url"] as? String, let url = URL(string: urlString) {
                                                    i.loadRemoteImage(from: url) { loadedImage in
                                                        if let image = loadedImage {
                                                            listofimages.append(image)
                                                        } else {
                                                            // Handle the case when the image couldn't be loaded
                                                            print("Failed to load the image from URL: \(url)")
                                                        }
                                                    }
                                                } else {
                                                    // Handle the case when the URL string is not valid
                                                    print("Invalid URL string")
                                                }

                                            }
                                        }
                                    })
                                    
                                    // Access the reference of each document
                                    let docRefData = doc.data()["doc"]

                                    // Ensure `docRefData` is a valid `DocumentReference`
                                    if let docRef = docRefData as? DocumentReference {
                                        // Use `docRef` to get the referenced document
                                        docRef.getDocument { (document, error) in
                                            if let error = error {
                                                print(error)
                                            } else {
                                                if let document = document, document.exists {
                                                    // Document exists, access the data using document.data()
                                                    if let documentData = document.data() {
                                                        // Access the specific fields from documentData as needed
                                                        if let title = documentData["title"] as? String,
                                                           let note = documentData["note"] as? String {
                                                            // Create Document datatype
                                                            let document = Document(title: title, note: note, images: listofimages)
                                                            convertedDocs.append(document)
                                                        }
                                                    }
                                                } else {
                                                    // Document doesn't exist
                                                    print("Referenced document does not exist")
                                                }
                                            }
                                        }
                                    } else {
                                        // Handle the case when `docRefData` is not a valid `DocumentReference`
                                        print("Invalid document reference data")
                                    }
                                }
                                
                                // Set documents equal to convertedDocs from snapshot
                                self.documents = convertedDocs
                                
                                // Reload the table
                                self.importantDocsView.tableViewDocs.reloadData()
                            }
                        }
                    } else {
                        print("Error: Docs not found in database")
                    }
                }
            }
    }


    @objc func onButtonSubmitTapped() {
        let newDocView = NewDocViewController()
        navigationController?.pushViewController(newDocView, animated: true)
    }

}

extension ImportantDocsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "docs", for: indexPath) as! DocsTableViewCell
        
        if let uwNote = documents[indexPath.row].note{
            cell.labelNote.text = "Notes: \(uwNote)"
        }
        if let uwTitle = documents[indexPath.row].title{
            cell.labelTitle.text = uwTitle
        }
        if let uwImage = documents[indexPath.row].images[0]{
            cell.imageReceipt.image = uwImage
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let individualDoc = IndividualDocViewController()
        navigationController?.pushViewController(individualDoc, animated: true)
    }
    
}
