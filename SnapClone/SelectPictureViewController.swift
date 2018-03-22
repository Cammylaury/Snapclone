//
//  SelectPictureViewController.swift
//  SnapClone
//
//  Created by Cameron Laury on 3/21/18.
//  Copyright © 2018 Cameron Laury. All rights reserved.
//

import UIKit

class SelectPictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var messageTextField: UITextField!
    
    
    var imageAdded = false
    var imagePicker: UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker?.delegate = self

    }
    
    @IBAction func selectPhotoTapped(_ sender: Any) {
        
        if imagePicker != nil {
        
        imagePicker?.sourceType = .photoLibrary
        present(imagePicker!, animated: true, completion: nil)
        }
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        
        if imagePicker != nil {
        imagePicker?.sourceType = .camera
        present(imagePicker!, animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
            imageAdded = true
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        
        if let message = messageTextField.text {
            if imageAdded && message != "" {
                //Segue
            } else {
                //Present an
                self.presentAlert(alert: "You forgot to add a picture or message!")
            }
        }
    }
    
    func presentAlert(alert: String) {
        let alertVC = UIAlertController(title: "Oh no!", message: alert, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alertVC.dismiss(animated: true, completion: nil)
        }
        
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }
}
