//
//  ViewController.swift
//  Componentes
//
//  Created by Abraham Quezada on 18/08/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    func update(){
       
        let range = CGFloat(slider.value)
        
        if range == 0 || range < 0.5{
            foto.image = UIImage(named: "cerebro")
        }
        
        else if range == 0.5 || range < 1{
            foto.image = UIImage(named: "pinky")
        }
        
        else if range == 1.0{
            foto.image = UIImage(named: "brain")
        }
        
        
    }
    
    @IBAction func sliderAction(_ sender: Any) {
        update()
    }
    
}

