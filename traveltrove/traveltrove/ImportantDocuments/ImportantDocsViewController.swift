//
//  ImportantDocsViewController.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/11/23.
//

import UIKit

class ImportantDocsViewController: UIViewController {
    let importantDocsView = ImportantDocumentsView()
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
    
    @objc func notificationReceivedForTextChanged(notification: Notification){
        documents.append(Document(title: (notification.object as! Document).title!,
                                  note:(notification.object as! Document).note!,
                                  image: (notification.object as! Document).image))
        importantDocsView.tableViewDocs.reloadData()
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
        if let uwImage = documents[indexPath.row].image{
            cell.imageReceipt.image = uwImage
        }
        return cell
    }
    
}
