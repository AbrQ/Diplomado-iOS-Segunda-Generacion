//
//  ViewController.swift
//  TrafficSegues
//
//  Created by Abraham Quezada on 24/08/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchSegue: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func yellowButtonTapped(_ sender: UIButton) {
        guard switchSegue.isOn else{ return }
        performSegue(withIdentifier: "yellowSegue", sender: nil)
    }
    
    @IBAction func greenButtonTapped(_ sender: UIButton) {
        guard switchSegue.isOn else {return}
        performSegue(withIdentifier: "greenSegue", sender: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToRed(unwindSegue: UIStoryboardSegue) {
        
    }


}

