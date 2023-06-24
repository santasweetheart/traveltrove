//
//  ImportantDocumentsProgessIndicator.swift
//  traveltrove
//
//  Created by Katherine on 6/23/23.
//

import Foundation

extension ImportantDocsViewController:ProgressSpinnerDelegate{
    func showActivityIndicator(){
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }
    
    func hideActivityIndicator(){
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}
