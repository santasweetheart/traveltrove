//
//  AddCollboaratorsView.swift
//  traveltrove
//
//  Created by Santa.
//
import UIKit

class AddCollaboratorsView: UIView {
    var scrollView: UIScrollView!
    var tableViewCollaborator: UITableView!
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
        tableViewCollaborator = UITableView()
        tableViewCollaborator.register(TableViewCollaboratorCell.self, forCellReuseIdentifier: "collaborators")
        tableViewCollaborator.separatorStyle = .none
        tableViewCollaborator.separatorColor = .clear
        tableViewCollaborator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewCollaborator)

    }


    func setupAddButton() {
        addButton = UIButton()
        addButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        addButton.tintColor = .white
        addButton.contentMode = .scaleToFill
        addButton.clipsToBounds = true
        addButton.translatesAutoresizingMaskIntoConstraints = false

        // Resizing the image within the button
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 40)
        addButton.setPreferredSymbolConfiguration(symbolConfig, forImageIn: .normal)
        self.addSubview(addButton)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -64),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),

            tableViewCollaborator.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8),
            tableViewCollaborator.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
            tableViewCollaborator.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -8),

            tableViewCollaborator.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: -16),
            
            addButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -8),
            addButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
