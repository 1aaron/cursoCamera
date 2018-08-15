//
//  MainViewController.swift
//  PhotoApp
//
//  Created by Developer on 8/14/18.
//  Copyright © 2018 Aaron. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var capturePhotoOutput: AVCapturePhotoOutput?
    @IBOutlet weak var cameraPreview: UIView!
    var imageCaptured : UIImage? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        //1 agregar al info.plist el permiso Privacy — Photo Library Usage Description y Privacy - Camera Usage Description y Privacy — Photo Library Additions Usage Description
        //después de agregar un UIView al controller iniciar eso para inicializar la cámara
        if let captureDevice = AVCaptureDevice.default(for: .video) {
            do {
                let input = try AVCaptureDeviceInput(device: captureDevice)
                captureSession = AVCaptureSession()
                captureSession?.addInput(input)
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
                videoPreviewLayer?.frame = view.layer.bounds
                cameraPreview.layer.addSublayer(videoPreviewLayer!)
                captureSession?.startRunning()
                // obtener instancia de ACCapturePhotoOutput
                capturePhotoOutput = AVCapturePhotoOutput()
                capturePhotoOutput?.isHighResolutionCaptureEnabled = true
                // Poner donde se va a guardar
                if capturePhotoOutput != nil {
                    captureSession?.addOutput(capturePhotoOutput!)
                }
            } catch {
                print(error)
            }
        }
    }
    //2
    @IBAction func openCamera(_ sender: Any) {
        // ver que capturePhotoOutput sea válido
        guard let capturePhotoOutput = self.capturePhotoOutput else { return }
        // Obtener instancia de AVCapturePhotoSettings
        let photoSettings = AVCapturePhotoSettings()
        // ver los settings necesarios
        photoSettings.isAutoStillImageStabilizationEnabled = true
        photoSettings.isHighResolutionPhotoEnabled = true
        photoSettings.flashMode = .auto
        capturePhotoOutput.capturePhoto(with: photoSettings, delegate: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toView":
            break
        default:
            break
        }
    }
}
