//
//  ListsViewController.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/11/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class ListsViewController: UIViewController {
    let cell = ListTableViewCell()
    let listsView = ListsView()
    let database = Firestore.firestore()
    var currentUser = Auth.auth().currentUser
    var handleAuth: AuthStateDidChangeListenerHandle?
    
    override func loadView() {
        view = listsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listsView.tableViewLists.separatorStyle = .none
        title = "Lists"
        
        
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            print()
            self.currentUser = user
            self.database.collection("users")
                .document("Hi@gmail.com")
                .collection("lists")
                .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                    print("Test 2")
                    if let documents = querySnapshot?.documents{
                        Static.lists.removeAll()
                        for document in documents{
                            do{
                                let list  = try document.data(as: List.self)
                                Static.lists.append(list)
                                print(list.name)
                            }catch{
                                print(error)
                            }
                        }
                        Static.lists.sort(by: {$0.name < $1.name})
                        self.listsView.tableViewLists.reloadData()
                    }
                })
            print("Test 3")
        }
        
        listsView.tableViewLists.delegate = self
        listsView.tableViewLists.dataSource = self
        listsView.saveButton.addTarget(self, action: #selector(onButtonSubmitTapped), for: .touchUpInside)
        listsView.tableViewLists.reloadData()
    }
    
    @objc func onButtonSubmitTapped() {
        if let unwrappedMessage = listsView.nameField.text{
            if !unwrappedMessage.isEmpty{
                Static.lists.append(List(name: unwrappedMessage, numItem: 0, totalVal: String(format: "%.2f", 0)))
                self.database.collection("users")
                    .document("Hi@gmail.com")
                    .collection("lists")
                    .document(unwrappedMessage)
                    .setData(["name":unwrappedMessage, "numItem":0, "totalVal":String(format: "%.2f", 0)])
                listsView.tableViewLists.reloadData()
                listsView.nameField.text = ""
                
               
            } else {
                showErrorAlert()
            }
        }
    }
    
    func showErrorAlert(){
        let alert = UIAlertController(title: "Error!", message: "Text Field must not be empty!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
}
    

extension ListsViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Static.lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lists", for: indexPath) as! ListTableViewCell
        cell.labelTitle.text = Static.lists[indexPath.row].name
        cell.labelNumItems.text = "Total Number of Items: " + String(Static.lists[indexPath.row].numItem)
        cell.labelValue.text = "Total Value: $" + Static.lists[indexPath.row].totalVal
       
//        let uwItems = Static.lists[indexPath.row].numItem{
//            cell.labelNumItems.text = "Total Number of Items: " + String(uwItems)
//        }
//        let uwValue = Static.lists[indexPath.row].totalVal{
//            cell.labelValue.text = "Total Value: $" + uwValue
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Static.lastNum = indexPath.row
        let seeListViewControl = SeeListViewController()
        seeListViewControl.delegate = self
        navigationController?.pushViewController(seeListViewControl, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Static.lists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
