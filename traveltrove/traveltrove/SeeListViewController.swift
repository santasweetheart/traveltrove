//
//  SeeListViewController.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/12/23.
//

import UIKit

class SeeListViewController: UIViewController {
    let seeLisView = SeeListView()
    var items = [Item]()
    
    override func loadView() {
        view = seeLisView
       // title = "Europe"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seeLisView.tableViewItems.separatorStyle = .none
        // Do any additional setup after loading the view.
        items.append(Item(name: "Europe", totalVal: 2))
        items.append(Item(name: "Europe", totalVal: 2))
        
        countTotal()
        seeLisView.tableViewItems.delegate = self
        seeLisView.tableViewItems.dataSource = self
        
        seeLisView.addButton.addTarget(self, action: #selector(onButtonSubmitTapped), for: .touchUpInside)
    }
    
    @objc func onButtonSubmitTapped() {
        items.append(Item(name: seeLisView.nameField.text, totalVal: Double(seeLisView.valueField.text!)))
        seeLisView.tableViewItems.reloadData()
        seeLisView.nameField.text = ""
        seeLisView.valueField.text = ""
        countTotal()
        
    }
    
    func countTotal(){
        var totalOfItems = 0.0
        for item in items {
            totalOfItems += item.totalVal!
        }
        
        seeLisView.totalLabel.text = "$\(totalOfItems)"
    }

}

extension SeeListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "items", for: indexPath) as! ItemsTableViewCell
        
        if let uwName = items[indexPath.row].name, let created = items[indexPath.row].totalVal{
            cell.labelTitle.text = uwName + " ($\(created))"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let seeListViewControl = SeeListViewController()
//        navigationController?.pushViewController(seeListViewControl, animated: true)
    }
}
