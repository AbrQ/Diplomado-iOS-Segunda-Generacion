//
//  HomeViewController.swift
//  DiplomadoUnam
//
//  Created by Abraham Quezada on 10/12/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       let customView = view as! HomeView
        customView.setFunnyColor()
        if User.hasSession {
            performSegue(withIdentifier: "showMusicController", sender: self)
        }else{
            performSegue(withIdentifier: "showLogin", sender: self)
        }
        
        
        //self.present(loginVC, animated: true, completion: nil)
        //self.view.addSubview(loginVC.view)
        //let loginView = Bundle.main.loadNibNamed("LoginView", owner: nil, options: nil)! [0] as! LoginView
        //self.view.addSubview(loginView)
        // Do any additional setup after loading the view.
    }
    
  
    
    /*override func loadView() {
        let customView = HomeView()
        customView.setFunnyColor()
        view = customView
    }*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
