//
//  ViewController.swift
//  LoginSegue
//
//  Created by Abraham Quezada on 24/08/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func goButtonTapped(_ sender: UIButton) {
        if textFieldUsername.text == "AbrQ" && textFieldPassword.text == "1234"{
            performSegue(withIdentifier: "welcomeSegue", sender: nil)
        }else{
            performSegue(withIdentifier: "errorSegue", sender: nil)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

