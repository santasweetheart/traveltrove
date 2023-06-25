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
    let childProgressView = ProgressSpinnerViewController()
    
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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadDocumentsIntoView()
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

        let uwNote = documents[indexPath.row].note
        let uwTitle = documents[indexPath.row].title
        let numOfImages = documents[indexPath.row].images.count
        let uwImageString = documents[indexPath.row].images[0]

        //print(uwImageString)
        if let url = URL(string: uwImageString) {
            cell.imageReceipt.loadRemoteImage(from: url)
            cell.labelNote.text = "Notes: \(uwNote)"
            cell.labelTitle.text = uwTitle
        } else {
            // The string couldn't be converted to a valid URL
            print("Invalid URL")
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let individualDoc = IndividualDocViewController(selectedDoc: documents[indexPath.row])
        navigationController?.pushViewController(individualDoc, animated: true)
    }
    
}
