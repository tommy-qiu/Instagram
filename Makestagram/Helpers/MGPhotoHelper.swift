//
//  MGPhotoHelper.swift
//  Makestagram
//
//  Created by Tommy Qiu on 7/11/17.
//  Copyright © 2017 Tommy Co. All rights reserved.
//

import UIKit


class MGPhotoHelper: NSObject {
    
    // MARK: - Properties
    
    var completionHandler: ((UIImage) -> Void)?
    
    // MARK: - Helper Methods
    func presentImagePickerController(with sourceType: UIImagePickerControllerSourceType, from viewController: UIViewController) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = sourceType
         imagePickerController.delegate = self
        viewController.present(imagePickerController, animated: true)
        
    }
    
    func presentActionSheet(from viewController: UIViewController) {
        // 1
        let alertController = UIAlertController(title: nil, message: "Where do you want to get your picture from?", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let capturePhotoAction = UIAlertAction(title: "Take Photo", style: .default, handler: { [unowned self] action in
                self.presentImagePickerController(with: .camera, from: viewController)
            })
            
            alertController.addAction(capturePhotoAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let uploadAction = UIAlertAction(title: "Upload from Library", style: .default, handler: { [unowned self] action in
                self.presentImagePickerController(with: .photoLibrary, from: viewController)
            })
            
            alertController.addAction(uploadAction)
        }

//        // 2
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            // 3
//            let capturePhotoAction = UIAlertAction(title: "Take Photo", style: .default, handler: { action in
//                // do nothing yet...
//            })
//            
//            // 4
//            alertController.addAction(capturePhotoAction)
//        }
//        
//        // 5
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
//            let uploadAction = UIAlertAction(title: "Upload from Library", style: .default, handler: { action in
//                // do nothing yet...
//            })
//            
//            alertController.addAction(uploadAction)
//        }
        
        // 6
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // 7
        viewController.present(alertController, animated: true)
    }
}
extension MGPhotoHelper: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            completionHandler?(selectedImage)
        }
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
