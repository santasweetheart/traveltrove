//
//  IndividualDocView.swift
//  traveltrove
//
//  Created by Santa on 6/13/23.
//

import UIKit

class IndividualDocView: UIView {
    
    var scrollView: UIScrollView!
    var tableViewImage: UITableView!
    var addButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .customTan

        // Set up elements
        setupScrollView()
        setupTableView()
        setupAddButton()
        initConstraints()
    }

    func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)

    }

    func setupTableView() {
        tableViewImage = UITableView()
        tableViewImage.register(TableViewImageCell.self, forCellReuseIdentifier: "images")
        tableViewImage.separatorStyle = .none
        tableViewImage.separatorColor = .clear
        tableViewImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewImage)

    }

    func setupAddButton(){
        addButton = UIButton.createPillShapedButton(withTitle: "Add A Photo", buttonColor: .white, size: CGSize(width: 300, height: 40))
        addButton.clipsToBounds = true
        addButton.showsMenuAsPrimaryAction = true
        self.addSubview(addButton)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),

            tableViewImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8),
            tableViewImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
            tableViewImage.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -8),

            tableViewImage.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: -16),
            
            addButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            addButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
