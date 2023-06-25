//
//  IndividualDocViewController.swift
//  traveltrove
//
//  Created by Santa on 6/13/23.
//

import UIKit
import PhotosUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
import FirebaseStorage

class IndividualDocViewController: UIViewController {
    let database = Firestore.firestore()
    let storage = Storage.storage()
    let currentUser = Auth.auth().currentUser
    let screen: IndividualDocView
    var selectedDoc : Document
    var pickedImage:UIImage?

    init(selectedDoc: Document) {
        self.screen = IndividualDocView()
        self.selectedDoc = selectedDoc
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedDoc.title
        screen.tableViewImage.backgroundColor = .customTan

        // Set up table view data source
        screen.tableViewImage.delegate = self
        screen.tableViewImage.dataSource = self

        // Pass image data to the table view
        screen.tableViewImage.reloadData()
        
        //Add Menu to pick image
        screen.addButton.menu = getMenuImagePicker()
    }
    
    
    func getMenuImagePicker() -> UIMenu{
        let menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
                
            })
        ]
        return UIMenu(title: "Select source", children: menuItems)
        }
    
    
    //MARK: pick Photo using Gallery...
    func pickPhotoFromGallery(){
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
            
        let photoPicker = PHPickerViewController(configuration: configuration)
            
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }
    
    //MARK: take Photo using Camera...
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}


extension IndividualDocViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedDoc.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "images", for: indexPath) as! TableViewImageCell

        // Calculate the index for the current row based on the count of images
        let rowIndex = selectedDoc.images.count - indexPath.row - 1
        
        //Cells appearing in the order in which they are added
        if rowIndex >= 0 && rowIndex < selectedDoc.images.count {
            let image = selectedDoc.images[rowIndex]
            if let url = URL(string: image) {
                cell.profileImageView.loadRemoteImage(from: url)
            } else {
                // The string couldn't be converted to a valid URL
                print("Invalid URL")
            }
        }

        return cell
    }

    
}

//MARK: adopting required protocols for PHPicker...
extension IndividualDocViewController:PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.pickedImage = uwImage
                            self.uploadImageToStorage()
                        }
                    }
                })
            }
        }
    }
}

//MARK: adopting required protocols for UIImagePicker...
extension IndividualDocViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.pickedImage = image
            uploadImageToStorage()
        }else{
            // Do your thing for No image loaded...
        }
    }
}



