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
    var totalLabel: UILabel!
    var valueField: UITextField!
    var addButton: UIButton!
    var nameField: UITextField!
    var saveButton: UIButton!
    var contentWrapper:UIScrollView!
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        backgroundColor = .customTan
        setupContentWrapper()
        setupTitleLabel()
        setupTotalLabel()
        setupNameField()
        setupValueField()
        setupSaveButton()
        setupTableViewExpense()
        initConstraints()
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
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
                
                totalLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 15),
                totalLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                contentWrapper.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 8),
                contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
                contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
                contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, constant: -150),
                
                tableViewItems.topAnchor.constraint(equalTo: contentWrapper.topAnchor),
                tableViewItems.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor),
                tableViewItems.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 8),
                tableViewItems.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -8),
                
                nameField.topAnchor.constraint(equalTo: self.contentWrapper.bottomAnchor, constant: 10),
                nameField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                nameField.widthAnchor.constraint(equalToConstant: 200),
                
                
                valueField.topAnchor.constraint(equalTo: self.contentWrapper.bottomAnchor, constant: 10),
                valueField.leadingAnchor.constraint(equalTo: self.nameField.trailingAnchor, constant: 10),
                valueField.widthAnchor.constraint(equalToConstant: 100),
                
                addButton.topAnchor.constraint(equalTo: self.contentWrapper.bottomAnchor, constant: 12),
                addButton.leadingAnchor.constraint(equalTo: self.valueField.trailingAnchor, constant: 10),
                addButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            ])
        }
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
