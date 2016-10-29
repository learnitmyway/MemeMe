//
//  ViewController.swift
//  MemeMe
//
//  Created by David  on 29/10/2016.
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func presentImagePicker(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        self.present(imagePicker, animated: true, completion: nil)
    }

}

