import UIKit

class AddCollaboratorsViewController: UIViewController {
    let collaboratorsScreen = AddCollaboratorsView()
    var collaborators = [User]()

    override func loadView() {
        view = collaboratorsScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Collaborators"
        self.collaboratorsScreen.tableViewCollaborator.backgroundColor = .customTan
        
        collaborators.append(User(name: "John Doe", email: "john@example.com"))
        collaborators.append(User(name: "Jane Smith", email: "jane@example.com"))
        collaborators.append(User(name: "Bob Johnson", email: "bob@example.com"))
        collaborators.append(User(name: "John Doe", email: "john@example.com"))
        collaborators.append(User(name: "Jane Smith", email: "jane@example.com"))
        collaborators.append(User(name: "Bob Johnson", email: "bob@example.com"))
        collaborators.append(User(name: "John Doe", email: "john@example.com"))
        collaborators.append(User(name: "Jane Smith", email: "jane@example.com"))
        collaborators.append(User(name: "Bob Johnson", email: "bob@example.com"))
        collaborators.append(User(name: "John Doe", email: "john@example.com"))
        collaborators.append(User(name: "Jane Smith", email: "jane@example.com"))
        collaborators.append(User(name: "Bob Johnson", email: "bob@example.com"))
        collaborators.append(User(name: "John Doe", email: "john@example.com"))
        collaborators.append(User(name: "Jane Smith", email: "jane@example.com"))
        collaborators.append(User(name: "Bob Johnson", email: "bob@example.com"))

        // Set up table view data source
        collaboratorsScreen.tableViewCollaborator.delegate = self
        collaboratorsScreen.tableViewCollaborator.dataSource = self

        // Set up add button action
        collaboratorsScreen.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        // Pass collaborators data to the table view
        collaboratorsScreen.tableViewCollaborator.reloadData()
    }

    @objc func addButtonTapped() {
        let addCollaboratorForm = UIAlertController(title: "Add Collaborator", message: "Add the information of the collaborator below:", preferredStyle: .alert)
        
        addCollaboratorForm.addTextField(configurationHandler: {
            (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Name"})
        
        addCollaboratorForm.addTextField(configurationHandler: {
            (textField : UITextField!) -> Void in
            textField.placeholder = "Enter email"})
        
        addCollaboratorForm.addTextField(configurationHandler: {
            (textField : UITextField!) -> Void in
            textField.placeholder = "Enter username"})
        
        addCollaboratorForm.addAction(UIAlertAction(title: "Add", style: .default))
        addCollaboratorForm.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        addCollaboratorForm.view.subviews.first?.backgroundColor = UIColor.customGreen
        present(addCollaboratorForm, animated: true)
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
