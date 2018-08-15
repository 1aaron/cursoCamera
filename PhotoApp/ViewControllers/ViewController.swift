//
//  ViewController.swift
//  PhotoApp
//
//  Created by Developer on 8/14/18.
//  Copyright © 2018 Aaron. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var image: UIImage? = nil
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if image != nil {
            imageView.image = image
        }
    }
}

