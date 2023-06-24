//
//  IndividualDocViewController.swift
//  traveltrove
//
//  Created by Santa on 6/13/23.
//

import UIKit
import PhotosUI

class IndividualDocViewController: UIViewController {

    let screen = IndividualDocView()
    var images = [UIImage]()
    var pickedImage:UIImage?

    override func loadView() {
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Trip Name"
        screen.tableViewImage.backgroundColor = .customTan
        
        images.append(UIImage(named: "logo")!)
        images.append(UIImage(named: "logo")!)
        images.append(UIImage(named: "logo")!)
        images.append(UIImage(named: "logo")!)
        images.append(UIImage(named: "logo")!)
        images.append(UIImage(named: "logo")!)
        images.append(UIImage(named: "logo")!)

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


}


extension IndividualDocViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "images", for: indexPath) as! TableViewImageCell

        let docImage = images[indexPath.row]

        // Configure the cell with image data
        cell.profileImageView.image =  docImage

        return cell
    }
    
}

//MARK: adopting required protocols for PHPicker...
extension IndividualDocViewController:PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.screen.addButton.setImage(
                                uwImage.withRenderingMode(.alwaysOriginal),
                                for: .normal
                            )
                            self.pickedImage = uwImage
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
            self.screen.addButton.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
            // Do your thing for No image loaded...
        }
    }
}



