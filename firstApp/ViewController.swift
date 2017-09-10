//
//  ViewController.swift
//  firstApp
//
//  Created by j0cker on 19/08/17.
//  Copyright © 2017 j0cker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var selectImageFromPhotoLibrary: UITapGestureRecognizer!
    
    @IBOutlet weak var ratingControl: RatingControl!
    
    
    @IBAction func setDefaultlabelView(sender: UIButton) {
        NSLog("hola")
        labelView.text = "Default Text"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("viewDidLoad")
        // Do any additional setup after loading the view, typically from a nib.
        
        // Handle the text field’s user input through delegate callbacks.
        textField.delegate = self
        let tapGesture = UITapGestureRecognizer(target:self, action: #selector(ViewController.imagePressed))
        imageView.userInteractionEnabled = true // this line is important
        imageView.addGestureRecognizer(tapGesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //you resign first responder status all mayority events passes here
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard when touch enter.
        textField.resignFirstResponder()
        return true
    }
    
    //is called after the text field resigns its first-responder status.
    // gives you a chance to read the information entered into the text field and do something with it
    
    func textFieldDidEndEditing(textField: UITextField) {
        labelView.text = textField.text
    }
    
    func imagePressed() {
        
        NSLog("selectImageFromPhotoLibrary")
        // Hide the keyboard.
        textField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    //when canceled imagepickernot
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //when select an image
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        imageView.image = selectedImage  // Dismiss the )
        dismissViewControllerAnimated(true, completion: nil)
    }



}

