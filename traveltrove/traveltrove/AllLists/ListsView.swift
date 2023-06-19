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
    var contentWrapper:UIScrollView!
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        backgroundColor = .customTan
        setupContentWrapper()
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
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        //contentWrapper.backgroundColor = .black
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
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
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor ,constant: -60),
                
            tableViewLists.topAnchor.constraint(equalTo: contentWrapper.topAnchor),
            tableViewLists.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor),
            tableViewLists.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 8),
            tableViewLists.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -8),
            tableViewLists.heightAnchor.constraint(equalTo: contentWrapper.heightAnchor),
                
            nameField.topAnchor.constraint(equalTo: self.contentWrapper.bottomAnchor, constant: 15),
            nameField.leadingAnchor.constraint(equalTo: self.tableViewLists.leadingAnchor),
            nameField.trailingAnchor.constraint(equalTo: self.contentWrapper.trailingAnchor, constant: -100),
            
            saveButton.topAnchor.constraint(equalTo: self.contentWrapper.bottomAnchor, constant: 17),
            saveButton.leadingAnchor.constraint(equalTo: self.nameField.trailingAnchor, constant: 10),
            saveButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant:  -10),
        ])
    }
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

