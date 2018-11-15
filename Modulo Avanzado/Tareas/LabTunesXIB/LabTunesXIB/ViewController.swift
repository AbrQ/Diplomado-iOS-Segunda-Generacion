//
//  ViewController.swift
//  LabTunesXIB
//
//  Created by Abraham Quezada on 11/13/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginButtonWasTouchUpInside(_ sender: Any) {
        guard let username = userName.text else {return}
        guard let password = passwordField.text else {return}
        if User.login(userName: username, password: password){
            //performSegue(withIdentifier: "loginSuccess", sender: self)
            let viewController: UIViewController = MusicViewController()
            
            self.present(viewController,animated: true, completion:nil)
        }
    }
    


}

