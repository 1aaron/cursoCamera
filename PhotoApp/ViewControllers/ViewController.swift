//
//  ViewController.swift
//  PhotoApp
//
//  Created by Developer on 8/14/18.
//  Copyright © 2018 Aaron. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var image: UIImage? = nil
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var imageView: UIImageView!
    //obtener la imágen proveniente del otro ViewController (después de probar el picker por si solo)
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        if image != nil {
            imageView.image = image
        }
    }
    
    //presentar el controlador para seleccionar fotografías
    @IBAction func openChooser(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
}

