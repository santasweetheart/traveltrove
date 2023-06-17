//
//  ListsViewController.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/11/23.
//

import UIKit

class ListsViewController: UIViewController {
    
    var lastName = ""
    let cell = ListTableViewCell()
    var lastSelection: NSIndexPath!
    var list = List(name: "", numItem: 0, totalVal: "0.00")
    let listsView = ListsView()
    //var lists = [List]()
    let notificationCenter = NotificationCenter.default
    //var listOwners = [DifferentGroups]()
    override func loadView() {
        view = listsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listsView.tableViewLists.separatorStyle = .none
        title = "Lists"
        
        listsView.tableViewLists.delegate = self
        listsView.tableViewLists.dataSource = self
        listsView.saveButton.addTarget(self, action: #selector(onButtonSubmitTapped), for: .touchUpInside)
        notificationCenter.addObserver(
            self,
            selector: #selector(notificationReceivedForTextChanged(notification:)),
            name: Notification.Name("textFromFirstScreen"),
            object: nil)
        listsView.tableViewLists.reloadData()
    }
    
    //codes omitted...
    @objc func notificationReceivedForTextChanged(notification: Notification){
        list = (notification.object as! List)
        listsView.tableViewLists.reloadData()
    }
    
    
    
    @objc func onButtonSubmitTapped() {
        if let unwrappedMessage = listsView.nameField.text{
            if !unwrappedMessage.isEmpty{
                Static.lists.append(List(name: unwrappedMessage, numItem: 0, totalVal: String(format: "%.2f", 0)))
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
        if let uwName = Static.lists[indexPath.row].name{
            cell.labelTitle.text = uwName 
            
        }
        
            if let uwItems = Static.lists[indexPath.row].numItem{
                cell.labelNumItems.text = "Total Number of Items: " + String(uwItems)
            }
            if let uwValue = Static.lists[indexPath.row].totalVal{
                cell.labelValue.text = "Total Value: $" + uwValue
            }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Static.name = Static.lists[indexPath.row].name!
        Static.lastNum = indexPath.row
//        Static.lastList = List(name: lists[indexPath.row].name!, numItem: lists[indexPath.row].numItem!,
//                               totalVal: lists[indexPath.row].totalVal!)
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
