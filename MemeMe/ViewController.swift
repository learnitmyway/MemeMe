//
//  ViewController.swift
//  MemeMe
//
//  Created by David  on 29/10/2016.
//
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.delegate = self
        if !self.isCameraAvailable() {
            self.cameraButton.isEnabled = false
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func presentImagePicker(_ sender: UIBarButtonItem) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        for (_, value) in info {
            if (value is UIImage) {
                imageView.image = value as? UIImage
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // TODO when I have actual device
    @IBAction func launchCamera(_ sender: UIBarButtonItem) {
        // check if camera is available
        if self.isCameraAvailable() {
            
            // check available media types for camera - necessary?
//            let mediaTypes = UIImagePickerController.availableMediaTypes(for:UIImagePickerControllerSourceType.camera)
            
            // TODO: check if mediaTypes contains kUTTypeImage necessary?
            
            // set media types - not necessary because default is kUTTypeImage
            
            // diable editing - necessary?
//            imagePicker.allowsEditing = false
            
            // TODO: check if iPhone
            
            // present interface
            present(imagePicker, animated: true, completion: nil)
            
            // TODO: if tablet
            // TODO: see documentation
            
        }
    }
    
    func isCameraAvailable() -> Bool {
       return UIImagePickerController.isSourceTypeAvailable(_:UIImagePickerControllerSourceType.camera)
    }
    
}

