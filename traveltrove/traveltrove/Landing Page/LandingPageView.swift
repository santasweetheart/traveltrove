//
//  LandingPage.swift
//  traveltrove
//
//  Created by Santa on 6/6/23.
//

import UIKit

class LandingPageView: UIView {
    
    var appNameLabel: UILabel!
    var logOutButton: UIButton!
    var sailBoatImageView: UIImageView!
    var suitcaseImageView: UIImageView!
    var suitcaseIcon: UIButton!
    var listIcon: UIButton!
    var documentsIcon: UIButton!
    var homeLabel : UILabel!
    var listLabel: UILabel!
    var documentsLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .customDarkPink
        
        setupLabels()
        setupLogOutButton()
        setupSailBoatImageView()
        setupSuitcaseImageView()
        setupHomeIcon()
        setupListIcon()
        setupDocumentsIcon()
        initConstraints()
        
        
    }
    
    func setupLabels(){
        appNameLabel = createLabel(labelText: "TravelTrove", size: 16, color: .white)
        homeLabel = createLabel(labelText: "Home", size: 10, color: .white)
        listLabel = createLabel(labelText: "Lists", size: 10, color: .white)
        documentsLabel = createLabel(labelText: "Documents", size: 10, color: .white)
        self.addSubview(appNameLabel)
        self.addSubview(homeLabel)
        self.addSubview(listLabel)
        self.addSubview(documentsLabel)
    }
    
    func setupLogOutButton(){
        logOutButton = UIButton.createPillShapedButton(withTitle: "Log Out", buttonColor: .white)
        self.addSubview(logOutButton)
    }
    
    func setupSailBoatImageView(){
        sailBoatImageView = UIImageView()
        sailBoatImageView.image = UIImage(named: "Vaction background")
        sailBoatImageView.contentMode = .scaleToFill
        sailBoatImageView.clipsToBounds = true
        sailBoatImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(sailBoatImageView)
    }
    
    func setupSuitcaseImageView(){
        suitcaseImageView = UIImageView()
        suitcaseImageView.image = UIImage(named: "suitcase with money")
        suitcaseImageView.contentMode = .scaleToFill
        suitcaseImageView.clipsToBounds = true
        suitcaseImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(suitcaseImageView)
    }
    
    func setupHomeIcon() {
        suitcaseIcon = UIButton()
        suitcaseIcon.setImage(UIImage(systemName: "suitcase.rolling.fill"), for: .normal)
        suitcaseIcon.tintColor = .white
        suitcaseIcon.contentMode = .scaleToFill
        suitcaseIcon.clipsToBounds = true
        suitcaseIcon.translatesAutoresizingMaskIntoConstraints = false
        
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 40)
        suitcaseIcon.setPreferredSymbolConfiguration(symbolConfig, forImageIn: .normal)
        self.addSubview(suitcaseIcon)
    }
    
    func setupListIcon() {
        listIcon = UIButton()
        listIcon.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        listIcon.contentMode = .scaleToFill
        listIcon.tintColor = .white
        listIcon.clipsToBounds = true
        listIcon.translatesAutoresizingMaskIntoConstraints = false
        
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 40)
        listIcon.setPreferredSymbolConfiguration(symbolConfig, forImageIn: .normal)
        self.addSubview(listIcon)
    }
    
    func setupDocumentsIcon(){
        documentsIcon = UIButton()
        documentsIcon.setImage(UIImage(systemName: "doc.on.doc.fill"), for: .normal)
        documentsIcon.contentMode = .scaleToFill
        documentsIcon.tintColor = .white
        documentsIcon.clipsToBounds = true
        documentsIcon.translatesAutoresizingMaskIntoConstraints = false
        
        //rezising the image within the button
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 40)
        documentsIcon.setPreferredSymbolConfiguration(symbolConfig, forImageIn: .normal)
        self.addSubview(documentsIcon)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            logOutButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            logOutButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            
            appNameLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            appNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            
            sailBoatImageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            sailBoatImageView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -64),
            
            suitcaseImageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            suitcaseImageView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: 96),
            
            suitcaseIcon.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            suitcaseIcon.topAnchor.constraint(equalTo: suitcaseImageView.bottomAnchor, constant: 80),
            suitcaseIcon.heightAnchor.constraint(equalToConstant: 40),
            suitcaseIcon.widthAnchor.constraint(equalToConstant: 35),
            
            homeLabel.centerXAnchor.constraint(equalTo: suitcaseIcon.centerXAnchor),
            homeLabel.topAnchor.constraint(equalTo: suitcaseIcon.bottomAnchor, constant: 8),
            
            listIcon.trailingAnchor.constraint(equalTo: suitcaseIcon.leadingAnchor, constant: -64),
            listIcon.topAnchor.constraint(equalTo: suitcaseImageView.bottomAnchor, constant: 80),
            listIcon.heightAnchor.constraint(equalToConstant: 40),
            listIcon.widthAnchor.constraint(equalToConstant: 40),
            
            listLabel.centerXAnchor.constraint(equalTo: listIcon.centerXAnchor),
            listLabel.topAnchor.constraint(equalTo: listIcon.bottomAnchor, constant: 8),
            
            
            documentsIcon.leadingAnchor.constraint(equalTo: suitcaseIcon.trailingAnchor, constant: 64),
            documentsIcon.topAnchor.constraint(equalTo: suitcaseImageView.bottomAnchor, constant: 80),
            documentsIcon.heightAnchor.constraint(equalToConstant: 40),
            documentsIcon.widthAnchor.constraint(equalToConstant: 40),
            
            documentsLabel.centerXAnchor.constraint(equalTo: documentsIcon.centerXAnchor),
            documentsLabel.topAnchor.constraint(equalTo: documentsIcon.bottomAnchor, constant: 8)
            
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
