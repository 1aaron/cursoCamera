//
//  extensionVC.swift
//  PhotoApp
//
//  Created by Developer on 8/15/18.
//  Copyright © 2018 Aaron. All rights reserved.
//

import UIKit
import AVFoundation

extension UIViewController : AVCapturePhotoCaptureDelegate {
    public func photoOutput(_ captureOutput: AVCapturePhotoOutput,
                     didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?,
                     previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?,
                 resolvedSettings: AVCaptureResolvedPhotoSettings,
                 bracketSettings: AVCaptureBracketedStillImageSettings?,
                 error: Error?) {
        // obtener la imágen capturada
        // Make sure we get some photo sample buffer
        guard error == nil,
            let photoSampleBuffer = photoSampleBuffer else {
                print("Error capturando foto: \(String(describing: error))")
                return
        }
        // Convert photo same buffer to a jpeg image data by using // AVCapturePhotoOutput
        guard let imageData =
            AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: photoSampleBuffer, previewPhotoSampleBuffer: previewPhotoSampleBuffer) else {
                return
        }
        // Initialise a UIImage with our image data
        let capturedImage = UIImage.init(data: imageData , scale: 1.0)
        if let image = capturedImage {
            // Save our captured image to photos album
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            //instanciar el storyboard y la siguiente pantalla
            let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            //agregar el ViewControllerID en storyBoard
            let mainVC = storyboard.instantiateViewController(withIdentifier: "ViewController")  as! ViewController
            //poner la imágen obtenida en el nuevo VC
            mainVC.image = image
            //agregar el VC al navigation controller
            self.navigationController?.pushViewController(mainVC, animated: true)
        }
    }
}
