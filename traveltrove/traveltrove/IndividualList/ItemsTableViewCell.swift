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
        setupWrapperCellView()
        setupLabelTitle()
        initConstraints()
    }
                
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
                        
                        //working with the shadows and colors...
//        wrapperCellView.backgroundColor = .white
//        wrapperCellView.layer.cornerRadius = 10.0
//        wrapperCellView.layer.shadowColor = UIColor.lightGray.cgColor      //.gray.cgColor
//        wrapperCellView.layer.shadowOffset = .zero
//        wrapperCellView.layer.shadowRadius = 6.0
//        wrapperCellView.layer.shadowOpacity = 0.7
                        
                        
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
//
            labelTitle.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 5),
//            labelTitle.bottomAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 5),
            labelTitle.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 5),
//            labelTitle.heightAnchor.constraint(equalToConstant: 32),
//            labelTitle.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
//
                                    
            wrapperCellView.heightAnchor.constraint(equalToConstant: 40)
                    ])
                }
        //MARK: unused methods...
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
