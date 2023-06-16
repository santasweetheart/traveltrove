//
//  DocsTableViewCell.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/11/23.
//

import UIKit

class DocsTableViewCell: UITableViewCell {
    var wrapperCellView: UIView!
        var labelTitle: UILabel!
        var labelNote: UILabel!
    var imageReceipt: UIImageView!
    
    
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            backgroundColor = .customTan
            setupWrapperCellView()
                    setupLabelTitle()
                    setupLabelAmount()
            setupimageReceipt()
                    initConstraints()
                }
                
                func setupWrapperCellView(){
                    wrapperCellView = UITableViewCell()
                        
                        //working with the shadows and colors...
                        wrapperCellView.backgroundColor = .white
                        wrapperCellView.layer.cornerRadius = 10.0
                    wrapperCellView.layer.shadowColor = UIColor.lightGray.cgColor      //.gray.cgColor
                        wrapperCellView.layer.shadowOffset = .zero
                        wrapperCellView.layer.shadowRadius = 6.0
                        wrapperCellView.layer.shadowOpacity = 0.7
                        
                        
                        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
                        self.addSubview(wrapperCellView)
                }
                

    
                func setupLabelTitle(){
                    labelTitle = UILabel()
                    labelTitle.translatesAutoresizingMaskIntoConstraints = false
                    wrapperCellView.addSubview(labelTitle)
                }
                func setupLabelAmount(){
                    labelNote = UILabel()
                   // labelNote.lineBreakMode = .byWordWrapping
                  //  labelNote.preferredMaxLayoutWidth = 2000
                    labelNote.translatesAutoresizingMaskIntoConstraints = false
                    labelNote.lineBreakMode = .byWordWrapping
                    labelNote.numberOfLines = 0
                    labelNote.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
                    //labelNote.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
                    
                  //  labelNote.preferredMaxLayoutWidth = width
                    wrapperCellView.addSubview(labelNote)
                }
    
    func setupimageReceipt(){
        imageReceipt = UIImageView()
        imageReceipt.image = UIImage(systemName: "photo")
        imageReceipt.contentMode = .scaleToFill
        imageReceipt.clipsToBounds = true
        imageReceipt.layer.cornerRadius = 10
        imageReceipt.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(imageReceipt)
    }
    

                
                func initConstraints(){
                    NSLayoutConstraint.activate([
                        wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 5),
                        wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
                        wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
                        wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
                                    
                                    labelTitle.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 2),
                        labelTitle.bottomAnchor.constraint(equalTo: imageReceipt.topAnchor, constant: 2),
                                    labelTitle.leadingAnchor.constraint(equalTo: imageReceipt.leadingAnchor, constant: 0),
                                    labelTitle.heightAnchor.constraint(equalToConstant: 32),
                                    labelTitle.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
                                    
                        labelNote.topAnchor.constraint(equalTo: wrapperCellView.topAnchor),
                        labelNote.leadingAnchor.constraint(equalTo: imageReceipt.trailingAnchor, constant: 8),
                        labelNote.heightAnchor.constraint(equalToConstant: 120),
                        labelNote.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.heightAnchor, constant: 150),
                        
                                    
                                    imageReceipt.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
                                    imageReceipt.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor, constant: 10),
                                    //MARK: it is better to set the height and width of an ImageView with constraints...
                                    imageReceipt.heightAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -40),
                                    imageReceipt.widthAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
                        imageReceipt.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 10),
                        
                                    
                                    wrapperCellView.heightAnchor.constraint(equalToConstant: 100)
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
