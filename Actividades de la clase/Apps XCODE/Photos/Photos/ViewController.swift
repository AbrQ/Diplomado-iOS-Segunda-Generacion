//
//  ViewController.swift
//  Photos
//
//  Created by Abraham Quezada on 10/5/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageViewC: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageViewC.isHidden = true
        addButton.layer.borderWidth = 1
        addButton.layer.cornerRadius = 7
        addButton.layer.borderColor = UIColor(red:0.56, green:0.27, blue:0.68, alpha:1.0).cgColor
        
        let rightButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(addPhoto))
        rightButton.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func addPhoto(){
        let actionSheet = UIAlertController(title: "Photos", message: "Select the source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        let imagePickerView = UIImagePickerController()
        actionSheet.addAction(UIAlertAction(title: "Photos Carret", style: .default, handler: { (action) in
            
            imagePickerView.sourceType = .camera
            imagePickerView.allowsEditing = true
            imagePickerView.delegate = self
            self.present(imagePickerView, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            imagePickerView.sourceType = .camera
            imagePickerView.allowsEditing = true
            imagePickerView.delegate = self
            self.present(imagePickerView, animated: true, completion: nil)
            
        }))
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    //MARK: PickerViewDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("User cancel the photo selection")
        picker.dismiss(animated: true, completion: nil)
    }
    
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Photo dictionary: \(info)")
        guard let image = info[.editedImage] as? UIImage else { return }
        imageViewC.image = image
        imageViewC.isHidden = false
        picker.dismiss(animated: true, completion: nil)
    }

    @IBAction func selectPhoto(_ sender: UIButton) {
    }
    
}

