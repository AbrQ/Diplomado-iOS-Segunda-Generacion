//
//  MainBarController.swift
//  Worldb
//
//  Created by Abraham Quezada on 10/2/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class MainBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadTheme()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func loadTheme() {
        if UserDefaults.standard.bool(forKey: "nightTheme"){
            self.tabBar.backgroundColor = UIColor.blue
            self.tabBar.tintColor = UIColor.aqua
        } else {
            self.tabBar.backgroundColor = UIColor.sand
            self.tabBar.tintColor = UIColor.blue
        }
    }
}

