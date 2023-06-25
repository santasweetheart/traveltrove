//
//  TableViewImageCell.swift
//  traveltrove
//
//  Created by Santa on 6/16/23.
//

import UIKit

class TableViewImageCell: UITableViewCell {
    var wrapperCellView: UIView!
    var profileImageView: UIImageView!


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor =  .customTan
        setupWrapperCellView()
        setupProfileImage()
        initConstraints()
      }

    func setupWrapperCellView(){
        wrapperCellView = UIView()
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.backgroundColor = .clear
        self.addSubview(wrapperCellView)
    }

    func setupProfileImage(){
        profileImageView = UIImageView()
        profileImageView.image = UIImage(systemName: "rectangle.fill")?.withRenderingMode(.alwaysOriginal)
        profileImageView.contentMode = .scaleToFill
        profileImageView.clipsToBounds = true
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(profileImageView)
    }

    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            profileImageView.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            profileImageView.centerXAnchor.constraint(equalTo: wrapperCellView.centerXAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor),
            profileImageView.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),

            wrapperCellView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }



    //MARK: Usnused functions
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
