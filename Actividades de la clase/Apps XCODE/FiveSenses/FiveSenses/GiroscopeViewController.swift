//
//  GiroscopeViewController.swift
//  FiveSenses
//
//  Created by Abraham Quezada on 10/19/18.
//  Copyright © 2018 fi.unam.mx. All rights reserved.
//

import UIKit
import CoreMotion

class GiroscopeViewController: UIViewController {

    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    let manager = CMMotionManager()
    let frecuency = 1.0 / 60.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        manager.gyroUpdateInterval = frecuency
    }
    
    var isActive: Bool? = false{
        didSet{
            guard let active = isActive else{ return }
            if active{
                startButton.setTitle("Stop", for: .normal)
            }else{
                startButton.setTitle("Start", for: .normal)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if isActive ?? false{
            super.viewWillDisappear(animated)
            manager.stopGyroUpdates()
        }
        
    }
    
    var timer: Timer!
    @IBAction func onTapStar(_ sender: UIButton) {
        self.isActive = !(isActive ?? false)
        if isActive!{
            manager.startGyroUpdates()
            self.timer = Timer(fire: Date(), interval: frecuency, repeats: true, block: { _ in
                guard let data = self.manager.gyroData else { return }
                self.xLabel.text = data.rotationRate.x.format()
                self.yLabel.text = data.rotationRate.y.format()
                self.zLabel.text = data.rotationRate.z.format()
                print("\(data.rotationRate)")
            })
            RunLoop.current.add(self.timer!, forMode: .default)
        }else{
            if self.timer != nil{
                self.timer?.invalidate()
                self.timer = nil
                manager.stopGyroUpdates()
            }
        }
       
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
