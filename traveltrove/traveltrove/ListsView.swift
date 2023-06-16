//
//  ListsView.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/11/23.
//

import UIKit

class ListsView: UIView {
    
    var tableViewLists: UITableView!
    var nameField: UITextField!
    var saveButton: UIButton!
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        backgroundColor = .customTan
        setupSaveButton()
        setupTableViewExpense()
        setupNameField()
        initConstraints()
    }

    func setupSaveButton(){
        saveButton = UIButton(type: .system)
        saveButton.setTitle("Save", for: .normal)
        saveButton.layer.cornerRadius = 5
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.layer.borderColor = UIColor.black.cgColor
        saveButton.backgroundColor = .white
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(saveButton)
    }

    func setupNameField(){
        nameField = UITextField()
        nameField.placeholder = "Name of List"
        nameField.borderStyle = .roundedRect
        nameField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameField)
    }

    func setupTableViewExpense(){
        tableViewLists = UITableView()
        tableViewLists.backgroundColor = .customTan
        tableViewLists.register(ListTableViewCell.self, forCellReuseIdentifier: "lists")
        tableViewLists.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewLists)
    }
        
        //MARK: setting the constraints...
        func initConstraints(){
            NSLayoutConstraint.activate([
                tableViewLists.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
                tableViewLists.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -40),
                tableViewLists.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
                tableViewLists.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
                
               // addButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                nameField.topAnchor.constraint(equalTo: self.tableViewLists.bottomAnchor, constant: 0),
                nameField.leadingAnchor.constraint(equalTo: self.tableViewLists.leadingAnchor),
                nameField.trailingAnchor.constraint(equalTo: self.tableViewLists.trailingAnchor, constant: -100),
                
                saveButton.topAnchor.constraint(equalTo: self.tableViewLists.bottomAnchor, constant: 2),
                saveButton.leadingAnchor.constraint(equalTo: self.nameField.trailingAnchor, constant: 10),
                saveButton.trailingAnchor.constraint(equalTo: self.tableViewLists.trailingAnchor),
                
            ])
        }
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

