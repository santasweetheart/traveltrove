//
//  AddCollaboratorsViewController.swift
//  traveltrove
//
//  Created by Katherine on 6/11/23.
//

import UIKit

class AddCollaboratorsViewController: UITableViewController {
    
    //MARK: Connecting the mainScreen to the ViewController
    let collaboratorsScreen = AddCollaboratorsView()
    
    override func loadView(){
        view = collaboratorsScreen
    }
    
    //MARK: contacts array to populate TableView...
    var collaborators = [String]()
    let cellReuseIdentifier = "CollaboratorCell"
    let names = ["Sam", "Sam", "Sam"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCollaboratorCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        //Setting the title of the Screen
        title = "Collaborators"
        
//        collaboratorsScreen.tableViewCollaborator.delegate = self
//        collaboratorsScreen.tableViewCollaborator.dataSource = self
//
        //Adding Dummy Data
        //        collaborators.append("Test 1")
        //        collaborators.append("Test 2")
        //        collaborators.append("Test 3")
    }
    
    
    //extension AddCollaboratorsViewController: UITableViewDelegate, UITableViewDataSource{
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return 5
    //    }
    //
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "collaborators", for: indexPath) as! TableViewCollaboratorCell
    //
    //        cell.nameLabel.text = "Test"
    //        return cell
    //    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! TableViewCollaboratorCell
        
        cell.nameLabel.text = names[indexPath.row]
        
        return cell
    }
}



//class AddCollaboratorsViewController: UIViewController {
//
//    //MARK: Connecting the mainScreen to the ViewController
//    let collaboratorsScreen = AddCollaboratorsView()
//
//    override func loadView(){
//        view = collaboratorsScreen
//    }
//
//    //MARK: contacts array to populate TableView...
//    var collaborators = [User]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //MARK: Setting Up To Navbar
//        //Setting the title of the Screen
//        title = "Collaborators"
//
//        collaboratorsScreen.tableViewCollaborator.delegate = self
//        collaboratorsScreen.tableViewCollaborator.dataSource = self
//
//        collaboratorsScreen.addButton.addTarget(self, action: #selector(onAddBarButtonTapped), for: .touchUpInside)
//
//        //Adding Dummy Data
//        collaborators.append(User(name: "John Doe", email: "john@example.com", image: UIImage(named: "logo")))
//        collaborators.append(User(name: "Jane Smith", email: "jane@example.com", image: UIImage(named: "logo")))
//        collaborators.append(User(name: "Bob Johnson", email: "bob@example.com", image: UIImage(named: "logo")))
//    }
//
//    /// Add Button functionality
//    @objc func onAddBarButtonTapped(){
//        //Popover should appear
//    }
//
//    //MARK: got the new contact back and delegated to ViewController...
//    func delegateOnAddContact(collaborator: User){
//        collaborators.append(collaborator)
//        collaboratorsScreen.tableViewCollaborator.reloadData()
//        }
//
//}
//
//extension AddCollaboratorsViewController: UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return collaborators.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "collaborators", for: indexPath) as! TableViewCollaboratorCell
//       // cell.xButton.addTarget(self, action: #selector(xButtonTapped(_:)), for: .touchUpInside)
//
//        cell.nameLabel.text = collaborators[indexPath.row].name
//
//        if let unwrapEmail = collaborators[indexPath.row].email{
//            cell.emailLabel.text = "\(unwrapEmail)"
//        }
//
//        //MARK: setting the image of the receipt...
//        if let unwrapImage = collaborators[indexPath.row].image{
//            cell.profileImageView.image = unwrapImage
//        }
//
//        return cell
//    }
//
////    //MARK: deal with user interaction with a cell...
////    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////
////    }
////
////    /// This function handles the delete function for the cell that is clicked
////    @objc func xButtonTapped(_ sender: UIButton) {
////        // Handle the X button tap event here
////        // delete from database
////    }
//
//
//}
//
