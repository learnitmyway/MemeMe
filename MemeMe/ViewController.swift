//
//  ViewController.swift
//  MemeMe
//
//  Created by David  on 29/10/2016.
//
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePicker.delegate = self
        self.topTextField.delegate = self
        self.bottomTextField.delegate = self
        
        if !self.isCameraAvailable() {
            self.cameraButton.isEnabled = false
        }
        
        // http://stackoverflow.com/questions/26070242/move-view-with-keyboard-using-swift 
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func share(_ sender: UIBarButtonItem) {
        let objectsToShare = [imageView.image!, topTextField.text!, bottomTextField.text!] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
        // TODO: consider iPad
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        imageView.image = nil
        topTextField.text = "TOP"
        bottomTextField.text = "BOTTOM"
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let existingText = textField.text
        if existingText == "TOP" || existingText == "BOTTOM" {
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height
            }
            else {
                
            }
        }
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
    
    @IBAction func presentImagePicker(_ sender: UIBarButtonItem) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // value is optional and is conditionally downcasted
        if let value = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = value
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}

