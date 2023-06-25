//
//  SeeListViewController.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/12/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class SeeListViewController: UIViewController {
    var delegate: ListsViewController!
    let seeLisView = SeeListView()
    var items = [Item]()
    var currentUser = Auth.auth().currentUser
    let database = Firestore.firestore()
    var handleAuth: AuthStateDidChangeListenerHandle?
    let notificationCenter = NotificationCenter.default
    var test = true
    
    override func loadView() {
        view = seeLisView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seeLisView.tableViewItems.separatorStyle = .none
        seeLisView.tableViewItems.allowsMultipleSelection = true
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if let mail = (user?.email) {
                self.currentUser = user
                self.database.collection("users")
                    .document((user?.email)!.lowercased())
                    .collection("lists")
                    .document(self.seeLisView.titleLabel.text!)
                    .collection("items")
                    .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                        if let documents = querySnapshot?.documents{
                            self.items.removeAll()
                            for document in documents{
                                do{
                                    let item  = try document.data(as: Item.self)
                                    self.items.append(item)
                                    self.countTotal()
                                }catch{
                                    print(error)
                                }
                            }
                            Static.lists.sort(by: {$0.name < $1.name})
                            self.seeLisView.tableViewItems.reloadData()
                        }
                    })
            } else {
                self.navigationController?.popViewController(animated: true)  
            }
        }
        seeLisView.tableViewItems.delegate = self
        seeLisView.tableViewItems.dataSource = self
        seeLisView.addButton.addTarget(self, action: #selector(onButtonSubmitTapped), for: .touchUpInside)
        seeLisView.titleLabel.text = Static.lists[Static.lastNum].name
    }

    @objc func onButtonSubmitTapped() {
        if let unwrappedMessage = seeLisView.nameField.text,
           let unwrappedValue = seeLisView.valueField.text{
            if !unwrappedMessage.isEmpty, !unwrappedValue.isEmpty{
                if let doubl = Double(unwrappedValue) {
                    items.append(Item(name: unwrappedMessage, totalVal: doubl, check: false))
                    seeLisView.tableViewItems.reloadData()
                    seeLisView.nameField.text = ""
                    seeLisView.valueField.text = ""
                    self.database.collection("users")
                        .document((self.currentUser?.email)!.lowercased())
                        .collection("lists")
                        .document(seeLisView.titleLabel.text!)
                        .collection("items")
                        .document(unwrappedMessage)
                        .setData(["name" : unwrappedMessage, "totalVal" : doubl, "check": false])
                    Static.lists[Static.lastNum].name = seeLisView.titleLabel.text!
                    Static.lists[Static.lastNum].numItem =  items.count
                    Static.lists[Static.lastNum].totalVal = String(countTotal())
                    delegate.listsView.tableViewLists.reloadData()
                    seeLisView.tableViewItems.reloadData()
                } else {
                    showNotDouble()
                }
            } else {
                showErrorAlert()
            }
        }
    }
    
    func showNotDouble(){
        let alert = UIAlertController(title: "Error!", message: "Value field isn't a number", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }

    func showErrorAlert(){
        let alert = UIAlertController(title: "Error!", message: "Text Fields must not be empty!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func countTotal() -> Double{
        var totalOfItems = 0.0
        for item in items {
            totalOfItems += item.totalVal
        }
        seeLisView.totalLabel.text = "$\(String(format: "%.2f", totalOfItems))"
        self.database.collection("users")
            .document((self.currentUser?.email)!.lowercased())
            .collection("lists")
            .document(seeLisView.titleLabel.text!)
            .setData(["name" : seeLisView.titleLabel.text, "numItem" : items.count, "totalVal" : "\(String(format: "%.2f", totalOfItems))"])
        return totalOfItems
    }
}

extension SeeListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "items", for: indexPath) as! ItemsTableViewCell
        let uwName = items[indexPath.row].name
        let created = items[indexPath.row].totalVal
        cell.labelTitle.text = uwName + " ($\(String(format: "%.2f", created)))"
        if(self.items[indexPath.row].check) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .checkmark
        self.database.collection("users")
            .document((self.currentUser?.email)!.lowercased())
            .collection("lists")
            .document(seeLisView.titleLabel.text!)
            .collection("items")
            .document(items[indexPath.row].name)
            .setData(["name" : items[indexPath.row].name, "totalVal" : items[indexPath.row].totalVal, "check":   true])
        self.items[indexPath.row].check = true
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .none
        self.database.collection("users")
            .document((self.currentUser?.email)!.lowercased())
            .collection("lists")
            .document(seeLisView.titleLabel.text!)
            .collection("items")
            .document(items[indexPath.row].name)
            .setData(["name" : items[indexPath.row].name, "totalVal" : items[indexPath.row].totalVal, "check": false])
        self.items[indexPath.row].check = false
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.database.collection("users")
                .document((self.currentUser?.email)!.lowercased())
                .collection("lists")
                .document(seeLisView.titleLabel.text!)
                .collection("items")
                .document(items[indexPath.row].name)
                .delete()
            
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            Static.lists[Static.lastNum].name = seeLisView.titleLabel.text!
            Static.lists[Static.lastNum].numItem =  items.count
            Static.lists[Static.lastNum].totalVal = String(countTotal())
            delegate.listsView.tableViewLists.reloadData()
        }
    }
}
