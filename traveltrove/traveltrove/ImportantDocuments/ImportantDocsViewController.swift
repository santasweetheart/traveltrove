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
        
        notificationCenter.addObserver(
            self,
            selector: #selector(notificationReceivedForTextChanged(notification:)),
            name: Notification.Name("textFromFirstScreen"),
            object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadDocumentsIntoView()
    }
    
    @objc func notificationReceivedForTextChanged(notification: Notification) {
        // documents.append(Document(title: (notification.object as! Document).title!,
        //                          note: (notification.object as! Document).note!,
        //                          image: (notification.object as! Document).image))
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
        let uwImage = documents[indexPath.row].images[0]
        
        cell.labelNote.text = "Notes: \(uwNote)"
        cell.labelTitle.text = uwTitle
        do{
            cell.imageReceipt.loadRemoteImage(from: try URL(from: uwImage as! Decoder))
        } catch {
            print(error)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let individualDoc = IndividualDocViewController()
        navigationController?.pushViewController(individualDoc, animated: true)
    }
    
}
