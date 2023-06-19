//
//  ListTableViewCell.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/11/23.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    var wrapperCellView: UIView!
    var labelTitle: UILabel!
    var labelValue: UILabel!
    var labelNumItems: UILabel!
    
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .customTan
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        setupWrapperCellView()
        setupLabelTitle()
        setupLabelValue()
        setupLabelNumItems()
        initConstraints()
    }

    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        wrapperCellView.backgroundColor = .customPeach
        wrapperCellView.layer.cornerRadius = 10
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
                
   func setupLabelTitle(){
        labelTitle = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelTitle)
    }
    
    func setupLabelValue(){
         labelValue = UILabel()
         labelValue.translatesAutoresizingMaskIntoConstraints = false
         wrapperCellView.addSubview(labelValue)
     }
    
    func setupLabelNumItems(){
         labelNumItems = UILabel()
         labelNumItems.translatesAutoresizingMaskIntoConstraints = false
         wrapperCellView.addSubview(labelNumItems)
     }

    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 5),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            
            labelTitle.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 5),
            labelTitle.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 5),
          
            labelValue.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -5),
            labelValue.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -5),
            
            labelNumItems.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -5),
            labelNumItems.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 5),
                                               
                                  
                                    
            wrapperCellView.heightAnchor.constraint(equalToConstant: 60)
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
