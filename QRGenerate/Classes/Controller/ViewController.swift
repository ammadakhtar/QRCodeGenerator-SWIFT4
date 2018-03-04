//
//  ViewController.swift
//  QRGenerate
//
//  Created by Ammad Akhtar

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutltes and variables

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myImageView: UIImageView!

    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: - IBActions

    @IBAction func button(_ sender: Any) {

        if let myString = myTextField.text {
            let data = myString.data(using: .ascii, allowLossyConversion: false)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "inputMessage")

            let qrCodeImage = UIImage(ciImage: (filter?.outputImage)!)
            myImageView.image = qrCodeImage
        }
    }
}

