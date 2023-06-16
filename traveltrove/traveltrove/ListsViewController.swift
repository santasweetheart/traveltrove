//
//  ListsViewController.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/11/23.
//

import UIKit

class ListsViewController: UIViewController {
    var lastSelection: NSIndexPath!
    let listsView = ListsView()
    var lists = [List]()
    
    var listOwners = [DifferentGroups]()
    override func loadView() {
        view = listsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listsView.tableViewLists.separatorStyle = .none
        title = "Lists"
        // Do any additional setup after loading the view.
        lists.append(List(name: "Europe", createdBy: "Me", numItem: 1, totalVal: 2))
        lists.append(List(name: "Europe", createdBy: "Me", numItem: 1, totalVal: 2))
        
        
        listsView.tableViewLists.delegate = self
        listsView.tableViewLists.dataSource = self
        
        listsView.saveButton.addTarget(self, action: #selector(onButtonSubmitTapped), for: .touchUpInside)
    }
    
    @objc func onButtonSubmitTapped() {
        lists.append(List(name: listsView.nameField.text, createdBy: "Me", numItem: 0, totalVal: 0.0))
        listsView.tableViewLists.reloadData()
        listsView.nameField.text = ""
    }

}

extension ListsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lists", for: indexPath) as! ListTableViewCell
        
        if let uwName = lists[indexPath.row].name, let created = lists[indexPath.row].createdBy{
            cell.labelTitle.text = uwName + " (Shared by \(created))"
        }
        if let uwItems = lists[indexPath.row].numItem{
            cell.labelNumItems.text = "Total Number of Items: " + String(uwItems)
        }
        if let uwValue = lists[indexPath.row].totalVal{
            cell.labelValue.text = "Total Value: $" + String(uwValue)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if self.lastSelection != nil {
//            self.listsView.tableViewLists.cellForRowAtIndexPath(self.lastSelection)?.accessoryType = .None
//            }
//
//            self.listsView.tableViewListscellForRowAtIndexPath(indexPath)?.accessoryType = .Checkmark
//
//            self.lastSelection = indexPath
//
//            self.myTableView.deselectRowAtIndexPath(indexPath, animated: true)
        let seeListViewControl = SeeListViewController()
        navigationController?.pushViewController(seeListViewControl, animated: true)
    }
    
}
