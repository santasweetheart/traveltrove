import UIKit

class AddCollaboratorsViewController: UIViewController {
    let collaboratorsScreen = AddCollaboratorsView()
    let collaborators = [User]()

    override func loadView() {
        view = collaboratorsScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up table view data source
        collaboratorsScreen.tableViewCollaborator.delegate = self
        collaboratorsScreen.tableViewCollaborator.dataSource = self

        // Set up add button action
        collaboratorsScreen.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)

        // Pass collaborators data to the table view
        collaboratorsScreen.tableViewCollaborator.reloadData()
    }

    @objc func addButtonTapped() {
        // Handle add button tap event
    }
}

extension AddCollaboratorsViewController: UITableViewDelegate, UITableViewDataSource {
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
