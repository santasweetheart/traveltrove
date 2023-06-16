//
//  SeeListView.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/12/23.
//

import UIKit

class SeeListView: UIView {

    var tableViewItems: UITableView!
    var titleLabel: UILabel!
    var createdLabel: UILabel!
    var totalLabel: UILabel!
    var valueField: UITextField!
    var addButton: UIButton!
    var addCollabButton: UIButton!
    var nameField: UITextField!
    var saveButton: UIButton!
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        backgroundColor = .customTan
        setupTitleLabel()
        setupCreatedByLabel()
        setupTotalLabel()
        setupNameField()
        setupValueField()
        setupSaveButton()
        setupAddCollabButton()
        setupTableViewExpense()
        initConstraints()
    }

    func setupSaveButton(){
        addButton = UIButton(type: .system)
        addButton.setTitle("Add", for: .normal)
        addButton.layer.cornerRadius = 5
        addButton.setTitleColor(.black, for: .normal)
        addButton.layer.borderColor = UIColor.black.cgColor
        addButton.backgroundColor = .white
        addButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addButton)
    }
    
    func setupAddCollabButton(){
        addCollabButton = UIButton(type: .system)
        addCollabButton.setTitle("Add Collaborators", for: .normal)
        addCollabButton.layer.cornerRadius = 5
        addCollabButton.setTitleColor(.black, for: .normal)
        addCollabButton.layer.borderColor = UIColor.black.cgColor
        addCollabButton.backgroundColor = .white
        addCollabButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addCollabButton)
    }
    
    func setupNameField(){
        nameField = UITextField()
        nameField.placeholder = "Name"
        nameField.borderStyle = .roundedRect
        nameField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameField)
    }
    
    
    func setupValueField(){
        valueField = UITextField()
        valueField.placeholder = "Value"
        valueField.borderStyle = .roundedRect
        valueField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(valueField)
    }
    
    func setupTotalLabel(){
        totalLabel = UILabel()
        totalLabel.text = "Total: $"
        totalLabel.font = UIFont.boldSystemFont(ofSize:15)
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(totalLabel)
    }


    func setupCreatedByLabel(){
        createdLabel = UILabel()
        createdLabel.text = "Created by (you or ___)"
        createdLabel.font = UIFont.systemFont(ofSize: 15)
        createdLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(createdLabel)
    }
    
    func setupTitleLabel(){
        titleLabel = UILabel()
        titleLabel.text = "List Name"
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
    }

    func setupTableViewExpense(){
        tableViewItems = UITableView()
        tableViewItems.backgroundColor = .customTan
        tableViewItems.register(ItemsTableViewCell.self, forCellReuseIdentifier: "items")
        tableViewItems.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewItems)
    }
        
        //MARK: setting the constraints...
        func initConstraints(){
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
                titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                createdLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 15),
                createdLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                totalLabel.topAnchor.constraint(equalTo: self.createdLabel.bottomAnchor, constant: 15),
                totalLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                tableViewItems.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 8),
                tableViewItems.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -80),
                tableViewItems.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
                tableViewItems.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
                
               // addButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                nameField.topAnchor.constraint(equalTo: self.tableViewItems.bottomAnchor, constant: 10),
                nameField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                nameField.widthAnchor.constraint(equalToConstant: 200),
                
                
                valueField.topAnchor.constraint(equalTo: self.tableViewItems.bottomAnchor, constant: 10),
                valueField.leadingAnchor.constraint(equalTo: self.nameField.trailingAnchor, constant: 10),
                valueField.widthAnchor.constraint(equalToConstant: 100),
                
                addButton.topAnchor.constraint(equalTo: self.tableViewItems.bottomAnchor, constant: 12),
                addButton.leadingAnchor.constraint(equalTo: self.valueField.trailingAnchor, constant: 10),
                addButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
                
                addCollabButton.topAnchor.constraint(equalTo: self.addButton.bottomAnchor, constant: 10),
                addCollabButton.leadingAnchor.constraint(equalTo: self.nameField.leadingAnchor),
                addCollabButton.trailingAnchor.constraint(equalTo: self.addButton.trailingAnchor),
                
            ])
        }
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
