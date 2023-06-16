//
//  NewDocViewController.swift
//  traveltrove
//
//  Created by Dillian Pica on 6/12/23.
//

import UIKit
import PhotosUI

class NewDocViewController: UIViewController {
    let newDocView = NewDocView()
    let notificationCenter = NotificationCenter.default
    var pickedImage:UIImage?
    
    override func loadView() {
        view = newDocView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .done, target: self,
                            action: #selector(onDoneBarButtonTapped)
                    )
        navigationItem.rightBarButtonItem?.tintColor = .black
        newDocView.buttonTakePhoto.menu = getMenuImagePicker()
    }
    

    @objc func onDoneBarButtonTapped(){
        if let name = newDocView.nameField.text, let note = newDocView.notesField.text{
            if !name.isEmpty && !note.isEmpty && pickedImage != nil {
                //MARK: posting text to NotificationCenter...
                notificationCenter.post(
                    name: Notification.Name("textFromFirstScreen"),
                    object: Document(title: name, note: note, image: self.pickedImage))
                navigationController?.popViewController(animated: true)
            }else{
                //Alert invalid input...
            }
        } else {
            
        }
    }
    
    func getMenuImagePicker() -> UIMenu{
            var menuItems = [
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
    
    func pickUsingCamera(){
            let cameraController = UIImagePickerController()
            cameraController.sourceType = .camera
            cameraController.allowsEditing = true
            cameraController.delegate = self
            present(cameraController, animated: true)
    }

}


extension NewDocViewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.newDocView.buttonTakePhoto.setImage(
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

extension NewDocViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.newDocView.buttonTakePhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            
        self.pickedImage = image
            
        }else{
            // Do your thing for No image loaded...
        }
    }
}