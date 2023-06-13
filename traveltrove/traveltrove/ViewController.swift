//
//  ViewController.swift
//  traveltrove
//
//  Created by Katherine on 5/30/23.
//
import UIKit

class ViewController: UIViewController {

    let collaboratorsScreen = AddCollaboratorsView()
    var collaborators = [User]()

    override func loadView() {
        view = collaboratorsScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collaborators.append(User(name: "John Doe", email: "john@example.com"))
        collaborators.append(User(name: "Jane Smith", email: "jane@example.com"))
        collaborators.append(User(name: "Bob Johnson", email: "bob@example.com"))

        // Set up table view data source
        collaboratorsScreen.tableViewCollaborator.delegate = self
        collaboratorsScreen.tableViewCollaborator.dataSource = self

//        // Set up add button action
//        collaboratorsScreen.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        // Pass collaborators data to the table view
        collaboratorsScreen.tableViewCollaborator.reloadData()
    }

    @objc func addButtonTapped() {
        let addCollaboratorsVC = AddCollaboratorsViewController()
        navigationController?.pushViewController(addCollaboratorsVC, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collaborators.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "collaborators", for: indexPath) as! TableViewCollaboratorCell

        let collaborator = collaborators[indexPath.row]

        // Configure the cell with collaborator data
        cell.nameLabel.text = collaborator.name
        cell.emailLabel.text = collaborator.email

        return cell
    }
}

