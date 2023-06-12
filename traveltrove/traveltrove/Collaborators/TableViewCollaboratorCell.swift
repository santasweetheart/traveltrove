//
//  TableViewCollaboratorCell.swift
//  traveltrove
//
//  Created by Santa.
//

import UIKit

class TableViewCollaboratorCell: UITableViewCell {
    var wrapperCellView: UIView!
    var nameLabel: UILabel!
    var xButton: UIButton!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupWrapperCellView()
        setupNameLabel()
        setupXButton()
        initConstraints()
    }

    func setupWrapperCellView() {
        wrapperCellView = UIView()
        wrapperCellView.layer.borderWidth = 1.0
        wrapperCellView.layer.borderColor = UIColor.gray.cgColor
        wrapperCellView.layer.cornerRadius = 8.0
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(wrapperCellView)
    }

    func setupNameLabel() {
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .systemPink
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        wrapperCellView.addSubview(nameLabel)
    }

    func setupXButton() {
        xButton = UIButton(type: .system)
        xButton.translatesAutoresizingMaskIntoConstraints = false
        // Configure the button appearance and actions as needed
        // Example: xButton.setTitle("X", for: .normal)
        //          xButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        wrapperCellView.addSubview(xButton)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            
            nameLabel.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            
            xButton.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            xButton.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -8),
            xButton.widthAnchor.constraint(equalToConstant: 24),
            xButton.heightAnchor.constraint(equalToConstant: 24),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

//class TableViewCollaboratorCell: UITableViewCell {
//    var wrapperCellView: UIView!
//    var nameLabel: UILabel!
//    var emailLabel: UILabel!
//    var profileImageView: UIImageView!
//    var xButton: UIButton!
//
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//          super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        setupWrapperCellView()
//        setupNameLabel()
//        setupEmailLabel()
//        setupProfileImage()
//        setupXButton()
//        initConstraints()
//      }
//
//    func setupWrapperCellView(){
//        wrapperCellView = UIView()
//        wrapperCellView.layer.borderWidth = 1.0
//        wrapperCellView.layer.borderColor = UIColor.gray.cgColor
//        wrapperCellView.layer.cornerRadius = 8.0
//        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(wrapperCellView)
//
//    }
//
//    func setupNameLabel(){
//        nameLabel = UILabel()
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
//        wrapperCellView.addSubview(nameLabel)
//    }
//
//    func setupEmailLabel(){
//        emailLabel = UILabel()
//        emailLabel.translatesAutoresizingMaskIntoConstraints = false
//        wrapperCellView.addSubview(emailLabel)
//
//    }
//
//    func setupProfileImage(){
//        profileImageView = UIImageView()
//        //person.fill makes iot blue for some reason so I added the renderingMode to make it black
//        profileImageView.image = UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal)
//        profileImageView.contentMode = .scaleToFill
//        profileImageView.clipsToBounds = true
//        profileImageView.layer.cornerRadius = 50
//        profileImageView.translatesAutoresizingMaskIntoConstraints = false
//        wrapperCellView.addSubview(profileImageView)
//    }
//
//    func setupXButton(){
//        xButton = UIButton(type: .system)
//        xButton.setImage(UIImage(systemName: "xmark"), for: .normal)
//        xButton.tintColor = .black
//        xButton.translatesAutoresizingMaskIntoConstraints = false
//        wrapperCellView.addSubview(xButton)
//    }
//
//    func initConstraints(){
//        NSLayoutConstraint.activate([
//            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
//            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
//            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
//            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
//
//            nameLabel.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 16),
//            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
//
//            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
//            emailLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
//            emailLabel.heightAnchor.constraint(equalToConstant: 20),
//
//            profileImageView.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
//            profileImageView.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
//            profileImageView.heightAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: 20),
//            profileImageView.widthAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: 20),
//
//            xButton.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
//            xButton.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -8),
//            xButton.widthAnchor.constraint(equalToConstant: 24),
//            xButton.heightAnchor.constraint(equalToConstant: 24),
//
//            wrapperCellView.heightAnchor.constraint(equalToConstant: 24)
//
//        ])
//    }
//
//
//    //MARK: Usnused functions
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//}
