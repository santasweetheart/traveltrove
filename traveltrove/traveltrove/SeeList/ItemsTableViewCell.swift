//
//  ItemsTableViewCell.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/12/23.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    var wrapperCellView: UIView!
    var labelTitle: UILabel!
      
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .customTan
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        setupWrapperCellView()
        setupLabelTitle()
        initConstraints()
    }
                
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
                
   func setupLabelTitle(){
        labelTitle = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelTitle)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 5),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            wrapperCellView.heightAnchor.constraint(equalToConstant: 40),
            
            labelTitle.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 5),
            labelTitle.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 5),
            ])
        }
    
        //MARK: unused methods...
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        override func awakeFromNib() {
            super.awakeFromNib()
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }

}
