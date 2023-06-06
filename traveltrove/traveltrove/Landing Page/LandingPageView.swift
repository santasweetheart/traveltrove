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
    var suitcaseIcon: UIImageView!
    var listIcon: UIImageView!
    var documentsIcon: UIImageView!
    var homeLabel : UILabel!
    var listLabel: UILabel!
    var documentsLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .customDarkPink
        
        setupLabels()
        setupLogOutButton()
        
    }
    
    func setupLabels(){
        appNameLabel = createLabel(labelText: "TravelTrove", size: 25, color: .white)
        homeLabel = createLabel(labelText: "Home", size: 16, color: .white)
        listLabel = createLabel(labelText: "Lists", size: 16, color: .white)
        documentsLabel = createLabel(labelText: "Documents", size: 16, color: .white)
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
        suitcaseIcon = UIImageView()
        suitcaseIcon.image = UIImage(systemName: "suitcase.rolling.fill")
        suitcaseIcon.contentMode = .scaleToFill
        suitcaseIcon.clipsToBounds = true
        suitcaseIcon.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(suitcaseIcon)
    }
    
    func setupListIcon() {
        listIcon = UIImageView()
        listIcon.image = UIImage(systemName: "list.bullet")
        listIcon.contentMode = .scaleToFill
        listIcon.clipsToBounds = true
        listIcon.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(listIcon)
    }
    
    func setupDocumentsIcon(){
        documentsIcon = UIImageView()
        documentsIcon.image = UIImage(systemName: "doc.on.doc.fill")
        documentsIcon.contentMode = .scaleToFill
        documentsIcon.clipsToBounds = true
        documentsIcon.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(documentsIcon)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
