//
//  ImportantDocumentsView.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/11/23.
//

import UIKit

class ImportantDocumentsView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let notificationCenter = NotificationCenter.default
    var tableViewDocs: UITableView!
    var addButton: UIButton!
    var contentWrapper:UIScrollView!
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        backgroundColor = .customTan
        setupContentWrapper()
        setupButton()
        setupTableViewExpense()
        initConstraints()
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupButton(){
        var config = UIButton.Configuration.filled()
        addButton = UIButton(type: .system)
       // config.background.backgroundColor = .customGreen
        config.baseBackgroundColor = .customGreen
        config.cornerStyle = .capsule
        config.baseForegroundColor = .black
        config.buttonSize = .large
        addButton.configuration = config
        addButton.setTitle("", for: .normal)
        addButton.showsMenuAsPrimaryAction = true
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
      //  addButton.backgroundColor = .blue
        //addButton.layer.cornerRadius = 5
        addButton.contentHorizontalAlignment = .fill
        addButton.contentVerticalAlignment = .fill
        addButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addButton)
}

    func setupTableViewExpense(){
        tableViewDocs = UITableView()
        tableViewDocs.backgroundColor = .customTan
        tableViewDocs.register(DocsTableViewCell.self, forCellReuseIdentifier: "docs")
        tableViewDocs.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewDocs)
    }
        
        //MARK: setting the constraints...
        func initConstraints(){
            NSLayoutConstraint.activate([
                contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
                contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
                contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
                contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, constant: -55),
                
                tableViewDocs.topAnchor.constraint(equalTo: contentWrapper.topAnchor),
                tableViewDocs.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor),
                tableViewDocs.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 8),
                tableViewDocs.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -8),
                
                addButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                addButton.topAnchor.constraint(equalTo: self.tableViewDocs.bottomAnchor, constant: 10)
            ])
        }
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
