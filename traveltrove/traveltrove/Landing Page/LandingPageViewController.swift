//
//  LandingPageViewController.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/19/23.
//

import UIKit
import FirebaseAuth

class LandingPageViewController: UIViewController {

    let landingPageView = LandingPageView()
    
    override func loadView() {
        view = landingPageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        landingPageView.listIcon.addTarget(self, action: #selector(listButtonSubmitTapped), for: .touchUpInside)
      //  landingPageView.suitcaseIcon.addTarget(self, action: #selector(suitButtonSubmitTapped), for: .touchUpInside)
        landingPageView.documentsIcon.addTarget(self, action: #selector(docButtonSubmitTapped), for: .touchUpInside)
        landingPageView.logOutButton.addTarget(self, action: #selector(signOutButtonSubmitTapped), for: .touchUpInside)

    }
    
    @objc func listButtonSubmitTapped() {
        let listCont = ListsViewController()
        navigationController?.pushViewController(listCont, animated: true)
    }
    
    @objc func signOutButtonSubmitTapped() {
        do{
            try Auth.auth().signOut()
        }catch{
            print("Error occured!")
        }
        navigationController?.popViewController(animated: true)
    }
    
    @objc func docButtonSubmitTapped() {
        let importantDocs = ImportantDocsViewController()
        navigationController?.pushViewController(importantDocs, animated: true)
    }

}
