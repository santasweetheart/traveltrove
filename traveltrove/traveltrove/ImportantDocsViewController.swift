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
        // Do any additional setup after loading the view.
        documents.append(Document(title: "Pixel 7 pro", note: "ds Pixel 7 pro Pixel 7 pro Pixel 7 pro Pixel 7 pro Pixel 7 pro Pixel 7 pro", image: (UIImage(systemName: "photo"))!))
        documents.append(Document(title: "iPhone SE", note: "sd", image: (UIImage(systemName: "photo"))!))        
        importantDocsView.tableViewDocs.delegate = self
        importantDocsView.tableViewDocs.dataSource = self
        
        importantDocsView.addButton.addTarget(self, action: #selector(onButtonSubmitTapped), for: .touchUpInside)
        
        
        
        notificationCenter.addObserver(
            self,
            selector: #selector(notificationReceivedForTextChanged(notification:)),
            name: Notification.Name("textFromFirstScreen"),
            object: nil)
        //codes omitted...
    }
    
    @objc func notificationReceivedForTextChanged(notification: Notification){
        print((notification.object as! Document).title)
        print((notification.object as! Document).note)
        documents.append(Document(title: (notification.object as! Document).title!,
                                  note:(notification.object as! Document).note!,
                                  image: (notification.object as! Document).image))
        importantDocsView.tableViewDocs.reloadData()
    }
    

    @objc func onButtonSubmitTapped() {
        let newDocView = NewDocViewController()
        navigationController?.pushViewController(newDocView, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ImportantDocsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "docs", for: indexPath) as! DocsTableViewCell
        
        if let uwNote = documents[indexPath.row].note{
            cell.labelNote.text = "Notes: $\(uwNote)"
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
