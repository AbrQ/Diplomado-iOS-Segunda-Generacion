//
//  AcelerometerViewController.swift
//  FiveSenses
//
//  Created by Abraham Quezada on 10/19/18.
//  Copyright © 2018 fi.unam.mx. All rights reserved.
//

import UIKit
import CoreMotion

class AcelerometerViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    let manager = CMMotionManager()
    let frecuency = 1.0 / 60.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        manager.accelerometerUpdateInterval = frecuency
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
            manager.stopAccelerometerUpdates()
        }
        
    }
    
    var timer: Timer!
    @IBAction func onTapStar(_ sender: UIButton) {
        self.isActive = !(isActive ?? false)
        if isActive!{
            manager.startAccelerometerUpdates()
            self.timer = Timer(fire: Date(), interval: frecuency, repeats: true, block: { _ in
                guard let data = self.manager.accelerometerData else { return }
                self.xLabel.text = data.acceleration.x.format()
                self.yLabel.text = data.acceleration.y.format()
                self.zLabel.text = data.acceleration.z.format()
                print("\(data.acceleration)")
            })
            RunLoop.current.add(self.timer!, forMode: .default)
        }else{
            if self.timer != nil{
                self.timer?.invalidate()
                self.timer = nil
                manager.stopAccelerometerUpdates()
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
