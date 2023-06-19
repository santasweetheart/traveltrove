//
//  SeeListViewController.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/12/23.
//

import UIKit

class SeeListViewController: UIViewController {
    var delegate: ListsViewController!
    let seeLisView = SeeListView()
    var items = [Item]()
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = seeLisView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seeLisView.tableViewItems.separatorStyle = .none
        seeLisView.tableViewItems.allowsMultipleSelection = true
        countTotal()
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
                    items.append(Item(name: seeLisView.nameField.text, totalVal: doubl))
                    seeLisView.tableViewItems.reloadData()
                    seeLisView.nameField.text = ""
                    seeLisView.valueField.text = ""
                    Static.lists[Static.lastNum].name = seeLisView.titleLabel.text
                    Static.lists[Static.lastNum].numItem =  items.count
                    Static.lists[Static.lastNum].totalVal = String(countTotal())
                    delegate.listsView.tableViewLists.reloadData()
                   // Static.list.numItem = 20
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
            totalOfItems += item.totalVal!
        }
        seeLisView.totalLabel.text = "$\(String(format: "%.2f", totalOfItems))"
        return totalOfItems
    }
}

extension SeeListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "items", for: indexPath) as! ItemsTableViewCell
        
        if let uwName = items[indexPath.row].name, let created = items[indexPath.row].totalVal{
            cell.labelTitle.text = uwName + " ($\(String(format: "%.2f", created)))"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .checkmark
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .none
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            Static.lists[Static.lastNum].name = seeLisView.titleLabel.text
            Static.lists[Static.lastNum].numItem =  items.count
            Static.lists[Static.lastNum].totalVal = String(countTotal())
            delegate.listsView.tableViewLists.reloadData()
        }
    }
}
